import 'package:binbear/ui/base_components/base_shimmer.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeBannerShimmer extends StatelessWidget {
  const HomeBannerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          BaseShimmer(
            width: Get.width/1.15,
            height: 173,
            borderRadius: 13,
            leftMargin: horizontalScreenPadding,
            rightMargin: 5,
          ),
          BaseShimmer(
            width: Get.width/1.15,
            height: 173,
            borderRadius: 13,
            rightMargin: horizontalScreenPadding,
          ),
        ],
      ),
    );
  }
}
