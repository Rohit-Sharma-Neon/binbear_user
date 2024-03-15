import 'package:binbear/utils/base_colors.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BaseVideoPlayer extends StatefulWidget {
  final String videoUrl;
  const BaseVideoPlayer({super.key, required this.videoUrl});

  @override
  State<BaseVideoPlayer> createState() => _BaseVideoPlayerState();
}

class _BaseVideoPlayerState extends State<BaseVideoPlayer> {

  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  bool isVideoInitializing = true;
  String currentMediaBaseURL = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
      await videoPlayerController.initialize();
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true,
      );
      setState(() {
        isVideoInitializing = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      body: isVideoInitializing
          ? const Center(child: CircularProgressIndicator(color: BaseColors.primaryColor))
          : Chewie(
            controller: chewieController,
      ),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
