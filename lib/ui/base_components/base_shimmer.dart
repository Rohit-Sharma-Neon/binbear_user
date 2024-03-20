import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class BaseShimmer extends StatelessWidget {
  final double width, height;
  final double? borderRadius;
  final double? topMargin, bottomMargin, rightMargin, leftMargin;
  const BaseShimmer({super.key, required this.width, required this.height, this.borderRadius, this.topMargin, this.bottomMargin, this.rightMargin, this.leftMargin});

  @override
  Widget build(BuildContext context) {
    return CardLoading(
      margin: EdgeInsets.only(top: topMargin??0, bottom: bottomMargin??0, right: rightMargin??0, left: leftMargin??0),
      width: width,
      height: height,
      borderRadius: BorderRadius.circular(borderRadius??99),
    );
  }
}
