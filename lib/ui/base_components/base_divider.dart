import 'package:flutter/material.dart';

class BaseDivider extends StatelessWidget {
  final double? topMargin, bottomMargin, rightMargin, leftMargin;
  const BaseDivider({super.key, this.topMargin, this.bottomMargin, this.rightMargin, this.leftMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1.3,
      margin: EdgeInsets.only(top: topMargin??12, bottom: bottomMargin??12, right: rightMargin??0, left: leftMargin??0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey.withOpacity(0.01),
            Colors.grey.shade500.withOpacity(1.0),
            Colors.grey.withOpacity(0.01),
          ],
        ),
      ),
    );
  }
}
