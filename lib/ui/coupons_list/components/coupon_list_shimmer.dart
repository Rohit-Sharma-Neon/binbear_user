import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_shimmer.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CouponListShimmer extends StatelessWidget {
  const CouponListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 7,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(BaseAssets.bgCoupon),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const BaseShimmer(
                      width: 150,
                      height: 40,
                      borderRadius: 10,
                    ),
                    const BaseShimmer(
                      topMargin: 10,
                      width: 100,
                      height: 15,
                      borderRadius: 10,
                    ),
                    BaseShimmer(
                      topMargin: 15,
                      width: Get.width/3,
                      height: 34,
                      borderRadius: 15,
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
