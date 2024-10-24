import 'package:flutter/material.dart';

// Reusable TrackItem widget
class TrackItem extends StatelessWidget {
  final String title;
  final String artist;
  final Duration duration;
  final VoidCallback onTap;

  TrackItem({
    required this.title,
    required this.artist,
    required this.duration,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.music_note, size: 40),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(artist),
      trailing: Text(
        '${duration.inMinutes}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}',
      ),
      onTap: onTap,
    );
  }
}

// Reusable TrackList widget
class TrackList extends StatelessWidget {
  final int itemCount;
  final Function(int index) onTrackTap;

  TrackList({
    required this.itemCount,
    required this.onTrackTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return TrackItem(
          title: 'Track ${index + 1}',
          artist: 'Artist ${index + 1}',
          duration: Duration(minutes: 3, seconds: 30),
          onTap: () {
            onTrackTap(index);
          },
        );
      },
    );
  }
}
