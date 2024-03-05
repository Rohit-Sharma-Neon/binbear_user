import 'package:binbear/utils/base_sizes.dart';
import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  final Widget child;
  final double? topMargin, bottomMargin, rightMargin, leftMargin;
  final double? topPadding, bottomPadding, rightPadding, leftPadding;
  final Color? color;
  final double? width, height;
  final double? borderRadius;
  final BoxBorder? border;
  final BoxShadow? boxShadow;
  const BaseContainer({super.key, required this.child, this.topMargin, this.bottomMargin, this.rightMargin, this.leftMargin, this.topPadding, this.bottomPadding, this.rightPadding, this.leftPadding, this.color, this.borderRadius, this.border, this.boxShadow, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      margin: EdgeInsets.only(top: topMargin??0, bottom: bottomMargin??50, right: rightMargin??0, left: leftMargin??0),
      padding: EdgeInsets.only(top: topPadding??20, bottom: bottomPadding??20, right: rightPadding??10, left: leftPadding??10),
      decoration: BoxDecoration(
        color: color??Colors.white,
        borderRadius: BorderRadius.circular(borderRadius??baseContainerRadius),
        border: border,
        boxShadow: boxShadow != null ? [
          boxShadow!,
        ] : null,
      ),
      child: child,
    );
  }
}
