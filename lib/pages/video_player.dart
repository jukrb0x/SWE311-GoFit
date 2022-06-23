import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class VideoPlayerPage extends StatefulWidget {
  VideoPlayerPage(this.title, this.link, {required this.description, Key? key}) : super(key: key);
  String title, link, description;

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState(title, link, description);
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late String title, link, description;

  _VideoPlayerPageState(this.title, this.link, this.description);

  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(link),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            PodVideoPlayer(controller: controller),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(),
            Padding(
          padding: EdgeInsets.all(10),
          child: Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),),
          ],
        ),
      ),
    );
  }
}
