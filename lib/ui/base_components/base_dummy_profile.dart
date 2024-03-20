import 'package:binbear/utils/base_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BaseDummyProfile extends StatelessWidget {
  final double? width, height, overflowHeight, overflowWidth, topMargin, bottomMargin, rightMargin, leftMargin;
  const BaseDummyProfile({super.key, this.width, this.height, this.overflowHeight, this.overflowWidth, this.topMargin, this.bottomMargin, this.rightMargin, this.leftMargin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin??0, bottom: bottomMargin??0, left: leftMargin??0, right: rightMargin??0),
      child: SizedBox(
        width: width??100,
        height: height??100,
        child: OverflowBox(
          minHeight: (overflowHeight??height),
          maxHeight: (overflowHeight??height),
          minWidth: (overflowWidth??width),
          maxWidth: (overflowWidth??width),
          child: Lottie.asset(
            BaseAssets.dummyProfileLottie,
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
