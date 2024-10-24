import 'package:flutter/material.dart';

class RecentlyAddedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recently Added"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: 10, // Assuming there are 10 recently added tracks
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.add_circle_outline),
            title: Text('Recently Added Track ${index + 1}'),
            subtitle: Text('Artist ${index + 1}'),
          );
        },
      ),
    );
  }
}
