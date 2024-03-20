// import 'package:binbear/ui/base_components/listview_builder_animation.dart';
// import 'package:binbear/utils/base_assets.dart';
// import 'package:card_loading/card_loading.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:shimmer/shimmer.dart';
//
// class IntroductoryShimmer extends StatelessWidget {
//   const IntroductoryShimmer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 6,
//       shrinkWrap: true,
//       padding: const EdgeInsets.only(top: 10, right: 36, left: 36),
//       itemBuilder: (context, index){
//         return ListviewBuilderAnimation(
//           index: index,
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               const CardLoading(
//                 height: 120,
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                 margin: EdgeInsets.only(bottom: 10),
//               ),
//               SvgPicture.asset(BaseAssets.icVideoPlayButton),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
