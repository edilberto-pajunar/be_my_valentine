import 'package:flutter/material.dart';

class WatcherScreen extends StatelessWidget {
  const WatcherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Who's Watching?"),
          Container(
            height: 50,
            width: 50,
            child: Icon(Icons.stadium_outlined),
          ),
        ],
      ),
    );
  }
}
