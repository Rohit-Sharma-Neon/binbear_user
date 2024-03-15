// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:video_thumbnail/video_thumbnail.dart';
//
// class BaseVideoThumbnail2 extends StatefulWidget {
//   final String videoLink;
//   final bool? addRoundness;
//   const BaseVideoThumbnail2({super.key, required this.videoLink, this.addRoundness});
//
//   @override
//   State<BaseVideoThumbnail2> createState() => _BaseVideoThumbnail2State();
// }
//
// class _BaseVideoThumbnail2State extends State<BaseVideoThumbnail2> {
//   File thumbnail = File("");
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       thumbnail = await genThumbnailFile(widget.videoLink);
//       setState(() {});
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//           alignment: Alignment.center,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular((widget.addRoundness??false) ? 15 : 0),
//               child: ColorFiltered(
//                 colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
//                 child: BaseImageNetwork(link: widget.videoLink,),
//               ),
//             ),
//             SvgPicture.asset("assets/images/ic_play.svg",color: Colors.grey),
//           ],
//         );
//   }
//   Future<File> genThumbnailFile(String path) async {
//     final fileName = await VideoThumbnail.thumbnailFile(
//       video: path,
//       thumbnailPath: (await getTemporaryDirectory()).path,
//       imageFormat: ImageFormat.PNG,
//       quality: 75,
//     );
//     File file = File(fileName??"");
//     return file;
//   }
// }
