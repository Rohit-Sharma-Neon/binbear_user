import 'dart:io';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class BaseVideoThumbnail2 extends StatefulWidget {
  final String videoLink;
  const BaseVideoThumbnail2({super.key, required this.videoLink});

  @override
  State<BaseVideoThumbnail2> createState() => _BaseVideoThumbnail2State();
}

class _BaseVideoThumbnail2State extends State<BaseVideoThumbnail2> {
  File thumbnail = File("");
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      thumbnail = await genThumbnailFile(widget.videoLink);
      isLoading = false;
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return isLoading ? const CardLoading(
      height: 120,
      width: double.infinity,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ) : ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
      child: Image.file(thumbnail, width: double.infinity, fit: BoxFit.fitWidth,),
    );
  }
  Future<File> genThumbnailFile(String path) async {
    final String? fileName = await VideoThumbnail.thumbnailFile(
      video: path,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.PNG,
      maxWidth: 100,
      quality: 100,
    );
    File file = File(fileName??"");
    return file;
  }
}
