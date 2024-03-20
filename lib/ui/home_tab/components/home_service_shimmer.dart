import 'package:binbear/ui/base_components/base_shimmer.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeServiceShimmer extends StatelessWidget {
  const HomeServiceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            width: 100,
            height: 110,
            margin: const EdgeInsets.only(left: horizontalScreenPadding, right: 12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BaseShimmer(width: 50, height: 40, borderRadius: 5),
                BaseShimmer(width: 70, height: 10, borderRadius: 5, topMargin: 14,),
                BaseShimmer(width: 40, height: 10, borderRadius: 5, topMargin: 4,),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            width: 100,
            height: 110,
            margin: const EdgeInsets.only(right: 12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BaseShimmer(width: 50, height: 40, borderRadius: 5),
                BaseShimmer(width: 70, height: 10, borderRadius: 5, topMargin: 14,),
                BaseShimmer(width: 40, height: 10, borderRadius: 5, topMargin: 4,),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            width: 100,
            height: 110,
            margin: const EdgeInsets.only(right: 12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BaseShimmer(width: 50, height: 40, borderRadius: 5),
                BaseShimmer(width: 70, height: 10, borderRadius: 5, topMargin: 14,),
                BaseShimmer(width: 40, height: 10, borderRadius: 5, topMargin: 4,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
