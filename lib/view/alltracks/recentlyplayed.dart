import 'package:flutter/material.dart';

class RecentlyPlayedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recently Played"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: 10, // Assuming there are 10 recently played tracks
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.history),
            title: Text('Recently Played Track ${index + 1}'),
            subtitle: Text('Artist ${index + 1}'),
          );
        },
      ),
    );
  }
}
