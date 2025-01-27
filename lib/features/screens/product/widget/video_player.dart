import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class BackVideoPlayer extends StatefulWidget {
  const BackVideoPlayer({super.key});

  @override
  State<BackVideoPlayer> createState() => _BackVideoPlayerState();
}

class _BackVideoPlayerState extends State<BackVideoPlayer> {
  late final VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('assets/videos/music-video.mp4')
      ..initialize().then((value) {
        setState(() {

        });
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: UniqueKey(),
      children: [
        FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            height: controller.value.size.height,
            width: controller.value.size.width,
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
          ),
        ),
        Positioned.fill(
          child: Center(child: IconButton(onPressed: (){
            setState(() {
              if(controller.value.isPlaying){
                controller.pause();
              }else{
                controller.play();
              }
            });
          }, icon:  Icon(controller.value.isPlaying ? Icons.pause : Icons.play_arrow,color: Colors.white,))),
        )
      ],
    );
  }
}
