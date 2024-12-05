import 'dart:developer';

import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatelessWidget {
  final String? episodeTitle;
  final int? episodeNumber;
  final String? episodeDate;
  final String? episodeTime;
  const MusicPlayerScreen({
    super.key,
    this.episodeTitle,
    this.episodeNumber,
    this.episodeDate,
    this.episodeTime,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        log('Device back button hi');
        return true; // Return true to allow the app to pop
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('$episodeNumber - $episodeTitle'),
        ),
        body: Column(
          children: [
            Text('Episode $episodeNumber'),
            Text('Episode Title: $episodeTitle'),
            Text('Episode Date: $episodeDate'),
            Text('Episode Time: $episodeTime'),
          ],
        ),
      ),
    );
  }
}
