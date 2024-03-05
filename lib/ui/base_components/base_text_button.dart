import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseTextButton extends StatelessWidget {
  final String? title;
  final Widget? child;
  final double? btnHeight, btnWidth;
  final double? bottomMargin, topMargin, rightMargin, leftMargin;
  final EdgeInsetsGeometry? btnPadding;
  final double? fontSize, borderRadius;
  final FontWeight? fontWeight;
  final Color? titleColor;
  final bool? enableHapticFeedback, hideKeyboard;
  final void Function()? onPressed;
  const BaseTextButton({super.key, this.title, this.btnHeight, this.btnWidth, this.titleColor, this.onPressed, this.bottomMargin, this.topMargin, this.rightMargin, this.leftMargin, this.fontSize, this.fontWeight, this.enableHapticFeedback, this.hideKeyboard, this.child, this.btnPadding, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: rightMargin??0, left: leftMargin??0, top: topMargin??0, bottom: bottomMargin??0),
      child: TextButton(
        style: TextButton.styleFrom(
            minimumSize: Size(btnWidth ?? double.infinity, btnHeight ?? 30),
            elevation: 0,
            padding: btnPadding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius??10),
            ),
        ),
        onPressed: (){
          if (enableHapticFeedback ?? true) {
            triggerHapticFeedback();
          }
          if (hideKeyboard ?? true) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
          if (onPressed != null) {
            onPressed!();
          }
        },
        child: AbsorbPointer(
          child: child ?? BaseText(
            value: title??"",
            color: titleColor ?? BaseColors.secondaryColor,
            fontWeight: fontWeight ?? FontWeight.w500,
            fontSize: fontSize ?? 15,
          ),
        ),
      ),
    );
  }
}
