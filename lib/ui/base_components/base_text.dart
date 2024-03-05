import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BaseText extends StatelessWidget {
  final String value;
  final double? fontSize, height, topMargin, bottomMargin, leftMargin, rightMargin;
  final double? onTapTopPadding, onTapBottomPadding, onTapLeftPadding, onTapRightPadding;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool? enableHapticFeedback, hideKeyboard;
  final void Function()? onTap;
  final TextOverflow? overflow;
  const BaseText({
    super.key,
    required this.value,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.topMargin, this.bottomMargin, this.leftMargin, this.rightMargin,
    this.height,
    this.onTap,
    this.onTapTopPadding, this.onTapBottomPadding, this.onTapLeftPadding, this.onTapRightPadding,
    this.enableHapticFeedback,
    this.hideKeyboard,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin??0, bottom: bottomMargin??0, right: rightMargin??0, left: leftMargin??0),
      child: GestureDetector(
        onTap: onTap!= null ? (){
          if (enableHapticFeedback ?? true) {
            triggerHapticFeedback();
          }
          if (hideKeyboard ?? true) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
          if (onTap != null) {
            onTap!();
          }
        }:null,
        child: Padding(
          padding: EdgeInsets.only(top: onTapTopPadding??0, bottom: onTapBottomPadding??0, right: onTapRightPadding??0, left: onTapLeftPadding??0),
          child: Text(
            value.tr,
            textAlign: textAlign ?? TextAlign.start,
            maxLines: maxLines,
            overflow: overflow,
            style: TextStyle(
              fontSize: fontSize ?? 14,
              height: height,
              color: color ?? Colors.black,
              fontWeight: fontWeight ?? FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
