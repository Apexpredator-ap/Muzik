import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _username = '';
  String? _selectedAvatar;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? 'Unknown User';
      _selectedAvatar = prefs.getString('avatar');
    });
  }

  Future<void> _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _username);
    if (_selectedAvatar != null) {
      await prefs.setString('avatar', _selectedAvatar!);
    }
  }

  void _showImageSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text("Select Profile Image"),
            content: Container(
              height: 200,
              width: 300,
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(5, (index) {
                  String imagePath = 'assets/images/avt${index + 1}.png';
                  bool isSelected = imagePath == _selectedAvatar;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedAvatar = imagePath;
                      });
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                            imagePath,
                            errorBuilder: (context, error, stackTrace) {
                              print('Error loading image: $imagePath');
                              return Icon(Icons.error);
                            },
                          ),
                        ),
                        if (isSelected)
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  if (_selectedAvatar != null) {
                    _saveUserData();
                    // Update the main widget tree state
                    this.setState(() {});
                    Navigator.of(context).pop();
                  }
                },
                child: Text("OK"),
              ),
            ],
          );
        });
      },
    );
  }

  void _showChangeUsernameDialog() {
    String newUsername = _username;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Change Username"),
          content: TextField(
            onChanged: (value) {
              newUsername = value;
            },
            decoration: InputDecoration(hintText: "Enter new username"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _username = newUsername;
                });
                _saveUserData();
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            'Profile Page',
            style: GoogleFonts.amaranth(
              textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  backgroundImage: _selectedAvatar != null
                      ? AssetImage(_selectedAvatar!)
                      : null,
                  child: _selectedAvatar == null
                      ? Icon(Icons.person, size: 50, color: Colors.white)
                      : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: _showImageSelectionDialog,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _selectedAvatar == null ? Icons.add : Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Welcome, $_username',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showChangeUsernameDialog,
              child: Text('Change Username'),
            ),
          ],
        ),
      ),
    );
  }
}
