import 'package:binbear/ui/base_components/base_text.dart';
import 'package:flutter/material.dart';

class BasePageSubTitle extends StatelessWidget {
  final String subTitle;
  final double? topMargin, bottomMargin, leftMargin, rightMargin, fontSize;
  const BasePageSubTitle({super.key, required this.subTitle, this.topMargin, this.bottomMargin, this.leftMargin, this.rightMargin, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return BaseText(
      topMargin: topMargin??10,
      bottomMargin: bottomMargin??18,
      rightMargin: rightMargin??0,
      leftMargin: leftMargin??0,
      value: subTitle,
      textAlign: TextAlign.center,
      fontSize: fontSize??14,
      color: const Color(0xffFBE6D3),
      fontWeight: FontWeight.w500,
    );
  }
}
