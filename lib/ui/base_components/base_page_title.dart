import 'package:binbear/ui/base_components/base_text.dart';
import 'package:flutter/material.dart';

class BasePageTitle extends StatelessWidget {
  final String title;
  final double? topMargin, bottomMargin, leftMargin, rightMargin;
  const BasePageTitle({super.key, required this.title, this.topMargin, this.bottomMargin, this.leftMargin, this.rightMargin});

  @override
  Widget build(BuildContext context) {
    return BaseText(
      topMargin: topMargin??75,
      bottomMargin: bottomMargin??0,
      rightMargin: rightMargin??0,
      leftMargin: leftMargin??0,
      value: title,
      textAlign: TextAlign.center,
      fontSize: 30,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    );
  }
}
