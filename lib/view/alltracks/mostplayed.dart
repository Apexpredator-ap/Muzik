import 'package:flutter/material.dart';

class MostPlayedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Most Played"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: 10, // Assuming there are 10 most played tracks
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.equalizer),
            title: Text('Most Played Track ${index + 1}'),
            subtitle: Text('Artist ${index + 1}'),
          );
        },
      ),
    );
  }
}
