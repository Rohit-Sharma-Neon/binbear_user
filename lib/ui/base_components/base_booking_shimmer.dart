import 'package:binbear/ui/base_components/base_shimmer.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BaseBookingShimmer extends StatelessWidget {
  final double? tileWidth, leftMargin, rightMargin, topMargin, bottomMargin;
  const BaseBookingShimmer({super.key, this.tileWidth, this.leftMargin, this.rightMargin, this.topMargin, this.bottomMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: tileWidth ?? MediaQuery.of(context).size.width/1.24,
      margin: EdgeInsets.only(left: leftMargin??0, right: rightMargin??0, top: topMargin??0, bottom: bottomMargin??0),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                BaseAssets.icPin,
                color: BaseColors.primaryColor,
                width: 24,
                height: 24,
              ),
              const Expanded(
                child: BaseShimmer(
                  width: 20,
                  height: 25,
                  leftMargin: 12,
                  rightMargin: 10,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 8, left: 4),
                child: BaseShimmer(
                  width: 27,
                  height: 27,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                BaseAssets.icCalendar,
                width: 18,
                height: 18,
              ),
              const BaseShimmer(
                width: 90,
                height: 15,
                leftMargin: 10,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                BaseAssets.icClock,
                width: 18,
                height: 18,
              ),
              const Expanded(
                child: Column(
                  children: [
                    BaseShimmer(
                      topMargin: 3,
                      width: double.infinity,
                      height: 15,
                      leftMargin: 10,
                    ),
                    BaseShimmer(
                      topMargin: 2,
                      width: double.infinity,
                      height: 15,
                      leftMargin: 10,
                    ),
                    BaseShimmer(
                      topMargin: 2,
                      width: double.infinity,
                      height: 15,
                      leftMargin: 10,
                      rightMargin: 80,
                      bottomMargin: 6,
                    ),
                  ],
                )
              ),
              const BaseShimmer(
                topMargin: 8,
                leftMargin: 8,
                width: 60,
                height: 30,
                borderRadius: 10,
              )
            ],
          ),
        ],
      ),
    );
  }
}
