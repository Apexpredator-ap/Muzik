//
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:muzik/view/settings.dart';
// import '../widgets/track.dart';
// import 'alltracks/alltracks.dart';
// import 'alltracks/mostplayed.dart';
// import 'alltracks/recentlyadded.dart';
// import 'alltracks/recentlyplayed.dart';
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int allTracksCount = 0;
//   int recentlyPlayedCount = 0;
//   int recentlyAddedCount = 0;
//   int mostPlayedCount = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadMusicData();
//   }
//
//   void _loadMusicData() {
//     setState(() {
//       allTracksCount = 0;
//       recentlyPlayedCount = 0;
//       recentlyAddedCount = 0;
//       mostPlayedCount = 0;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         toolbarHeight: 70,
//         title: Text(
//           "Music Player",
//           style: GoogleFonts.amaranth(
//             textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//           ),
//         ),
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30)),
//               gradient: LinearGradient(
//                   colors: [Colors.blueGrey, Colors.blueGrey],
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter)),
//         ),
//         systemOverlayStyle: SystemUiOverlayStyle.light,
//       ),
//       backgroundColor: Colors.blue,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   _buildCategoryGrid(),
//                   _buildPlaylistSection(),
//                   _buildTrackList(),
//                 ],
//               ),
//             ),
//           ),
//           _buildNowPlayingBar(), // Fixed now playing bar
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCategoryGrid() {
//     return GridView.count(
//       shrinkWrap: true,
//       crossAxisCount: 2,
//       childAspectRatio: 1.2,
//
//       mainAxisSpacing: 15,
//       crossAxisSpacing: 15,
//       padding: EdgeInsets.all(8),
//       children: [
//         _buildCategoryItem('ALL TRACKS', Icons.library_music, Colors.red[300]!,
//             allTracksCount),
//         _buildCategoryItem('RECENTLY PLAYED', Icons.history, Colors.blue[200]!,
//             recentlyPlayedCount),
//         _buildCategoryItem('RECENTLY ADDED', Icons.add_circle_outline,
//             Colors.green[300]!, recentlyAddedCount),
//         _buildCategoryItem('MOST PLAYED', Icons.equalizer, Colors.purple[300]!,
//             mostPlayedCount),
//       ],
//     );
//   }
//   Widget _buildCategoryItem(
//       String title, IconData icon, Color color, int count) {
//     return GestureDetector(
//       onTap: () {
//         if (title == 'ALL TRACKS') {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => AllTracksPage()),
//           );
//         } else if (title == 'RECENTLY PLAYED') {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => RecentlyPlayedPage()),
//           );
//         } else if (title == 'RECENTLY ADDED') {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => RecentlyAddedPage()),
//           );
//         } else if (title == 'MOST PLAYED') {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => MostPlayedPage()),
//           );
//         }
//       },
//       child: SizedBox(
//         height: 100,
//         width: 100,
//         child: Card(
//           color: color,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(count.toString(),
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               Icon(icon, size: 35),
//               Text(title, style: TextStyle(fontSize: 14)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   //
//   // Widget _buildCategoryItem(
//   //     String title, IconData icon, Color color, int count) {
//   //   return SizedBox(
//   //     height: 100,
//   //     width: 100,
//   //     child: Card(
//   //       color: color,
//   //       child: Column(
//   //         mainAxisAlignment: MainAxisAlignment.center,
//   //         children: [
//   //           Text(count.toString(),
//   //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//   //           Icon(icon, size: 35),
//   //           Text(title, style: TextStyle(fontSize: 14)),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
//
//   Widget _buildPlaylistSection() {
//     return Column(
//       children: [
//         ListTile(
//           title: Text('PLAYLIST(3)'),
//           trailing: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               IconButton(icon: Icon(Icons.add), onPressed: () {}),
//               IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: () {}),
//             ],
//           ),
//         ),
//         Container(
//           height: 100,
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             children: [
//               _buildPlaylistItem('Default list', 0),
//               _buildPlaylistItem('Myrecordings', 0),
//               _buildPlaylistItem('New playlist 1', 19),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPlaylistItem(String name, int count) {
//     return Card(
//       color: Colors.blue[200],
//       child: Container(
//         width: 100,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(count.toString(),
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//             Icon(Icons.music_note),
//             Text(name, textAlign: TextAlign.center),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTrackList() {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       // Prevents ListView from scrolling independently
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return TrackItem(
//           title: 'Track ${index + 1}',
//           artist: 'Artist ${index + 1}',
//           duration: Duration(minutes: 3, seconds: 30),
//           onTap: () {
//             // Handle track selection
//           },
//         );
//       },
//     );
//   }
//
//   Widget _buildNowPlayingBar() {
//     return Container(
//       height: 60,
//       color: Colors.blue[700],
//       child: Row(
//         children: [
//           Image.asset('assets/album_cover.jpg', width: 60, height: 60),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Currently Playing Track',
//                     style: TextStyle(color: Colors.white)),
//                 Text('Artist Name', style: TextStyle(color: Colors.white70)),
//               ],
//             ),
//           ),
//           IconButton(
//               icon: Icon(Icons.play_arrow, color: Colors.white),
//               onPressed: () {}),
//           IconButton(
//               icon: Icon(Icons.skip_next, color: Colors.white),
//               onPressed: () {}),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//

///
///
// ///
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muzik/view/settings.dart';
import '../widgets/track.dart';
import 'alltracks/alltracks.dart';
import 'alltracks/mostplayed.dart';
import 'alltracks/recentlyadded.dart';
import 'alltracks/recentlyplayed.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int allTracksCount = 0; // Initialize to 0
  int recentlyPlayedCount = 0;
  int recentlyAddedCount = 0;
  int mostPlayedCount = 0;

  @override
  void initState() {
    super.initState();
    _loadMusicData();
  }

  void _loadMusicData() {
    setState(() {
      // Initialize other counts as needed
      recentlyPlayedCount = 10;
      recentlyAddedCount = 5;
      mostPlayedCount = 15;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text(
          "Music Player",
          style: GoogleFonts.amaranth(
            textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              gradient: LinearGradient(
                  colors: [Colors.blueGrey, Colors.blueGrey],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildCategoryGrid(),
                  _buildPlaylistSection(),
                  _buildTrackList(),
                ],
              ),
            ),
          ),
          _buildNowPlayingBar(),
        ],
      ),
    );
  }

  Widget _buildCategoryGrid() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 1.2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      padding: EdgeInsets.all(8),
      children: [
        _buildCategoryItem('ALL TRACKS', Icons.library_music, Colors.red[300]!,
            allTracksCount),
        _buildCategoryItem('RECENTLY PLAYED', Icons.history, Colors.blue[200]!,
            recentlyPlayedCount),
        _buildCategoryItem('RECENTLY ADDED', Icons.add_circle_outline,
            Colors.green[300]!, recentlyAddedCount),
        _buildCategoryItem('MOST PLAYED', Icons.equalizer, Colors.purple[300]!,
            mostPlayedCount),
      ],
    );
  }

  Widget _buildCategoryItem(
      String title, IconData icon, Color color, int count) {
    return GestureDetector(
      onTap: () async {
        if (title == 'ALL TRACKS') {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AllTracksPage()),
          );
          if (result != null) {
            setState(() {
              allTracksCount = result;
            });
          }
        } else if (title == 'RECENTLY PLAYED') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RecentlyPlayedPage()),
          );
        } else if (title == 'RECENTLY ADDED') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RecentlyAddedPage()),
          );
        } else if (title == 'MOST PLAYED') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MostPlayedPage()),
          );
        }
      },
      child: SizedBox(
        height: 100,
        width: 100,
        child: Card(
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(count.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Icon(icon, size: 35),
              Text(title, style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaylistSection() {
    return Column(
      children: [
        ListTile(
          title: Text('PLAYLIST(3)'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(icon: Icon(Icons.add), onPressed: () {}),
              IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: () {}),
            ],
          ),
        ),
        Container(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildPlaylistItem('Default list', 0),
              _buildPlaylistItem('Myrecordings', 0),
              _buildPlaylistItem('New playlist 1', 19),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPlaylistItem(String name, int count) {
    return Card(
      color: Colors.blue[200],
      child: Container(
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(count.toString(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Icon(Icons.music_note),
            Text(name, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return TrackItem(
          title: 'Track ${index + 1}',
          artist: 'Artist ${index + 1}',
          duration: Duration(minutes: 3, seconds: 30),
          onTap: () {
            // Handle track selection
          },
        );
      },
    );
  }

  Widget _buildNowPlayingBar() {
    return Container(
      height: 60,
      color: Colors.blue[700],
      child: Row(
        children: [
          Image.asset('assets/album_cover.jpg', width: 60, height: 60),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Currently Playing Track',
                    style: TextStyle(color: Colors.white)),
                Text('Artist Name', style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          IconButton(
              icon: Icon(Icons.play_arrow, color: Colors.white),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.skip_next, color: Colors.white),
              onPressed: () {}),
        ],
      ),
    );
  }
}

///new code
///HomePage (Modified for Permission Request)
