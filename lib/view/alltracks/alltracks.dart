import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AllTracksPage extends StatefulWidget {
  @override
  _AllTracksPageState createState() => _AllTracksPageState();
}

class _AllTracksPageState extends State<AllTracksPage> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  List<SongModel> _songs = [];

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  void requestPermission() async {
    bool permissionStatus = await _audioQuery.permissionsStatus();
    if (!permissionStatus) {
      await _audioQuery.permissionsRequest();
    }
    fetchSongs();
  }

  void fetchSongs() async {
    List<SongModel> songs = await _audioQuery.querySongs();
    setState(() {
      _songs = songs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "ALL TRACKS",
          style: GoogleFonts.amaranth(
            textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, _songs.length); // Return the actual song count
          },
        ),
      ),
      body: _songs.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _songs.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: ListTile(
              title: Text(
                _songs[index].title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                _songs[index].artist ?? "Unknown Artist",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              onTap: () {
                // Handle song tap (e.g., play music)
              },
            ),
          );
        },
      ),
    );
  }
}