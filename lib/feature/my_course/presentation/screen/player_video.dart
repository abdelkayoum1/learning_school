import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:fooditem/feature/data/model/model_course.dart';
import 'package:video_player/video_player.dart';

class PlayerVideo extends StatefulWidget {
  final ModelCourse cours;
  const PlayerVideo({super.key, required this.cours});

  @override
  State<PlayerVideo> createState() => _PlayerVideoState();
}

class _PlayerVideoState extends State<PlayerVideo> {
  late FlickManager flickManager;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.networkUrl(
              Uri.parse(widget.cours.url.toString()),
            )
            ..initialize().then((onValue) {
              setState(() {});
            }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = flickManager.flickVideoManager!.videoPlayerController;
    return Scaffold(
      body: controller == null
          ? Center(child: CircularProgressIndicator())
          : controller.value.hasError
          ? Center(child: Text('error'))
          : !controller.value.isInitialized
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: FlickVideoPlayer(flickManager: flickManager),
              ),
            ),
    );
  }
}
