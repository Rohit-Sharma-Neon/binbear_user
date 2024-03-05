import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseOutlinedButton extends StatelessWidget {
  final String? title;
  final Widget? child;
  final double? btnHeight, btnWidth;
  final double? bottomMargin, topMargin, rightMargin, leftMargin;
  final double? btnBottomPadding, btnTopPadding, btnRightPadding, btnLeftPadding;
  final double? fontSize, borderRadius;
  final FontWeight? fontWeight;
  final Color? titleColor;
  final bool? enableHapticFeedback, hideKeyboard;
  final void Function()? onPressed;
  const BaseOutlinedButton({super.key, this.title, this.btnHeight, this.btnWidth, this.titleColor, this.onPressed, this.bottomMargin, this.topMargin, this.rightMargin, this.leftMargin, this.fontSize, this.fontWeight, this.enableHapticFeedback, this.hideKeyboard, this.child, this.btnBottomPadding, this.btnTopPadding, this.btnRightPadding, this.btnLeftPadding, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: rightMargin??0, left: leftMargin??0, top: topMargin??0, bottom: bottomMargin??0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          elevation: 3,
          minimumSize: const Size(0, 0),
          shadowColor: BaseColors.secondaryColor,
          backgroundColor: BaseColors.tertiaryColor,
          foregroundColor: BaseColors.tertiaryColor,
          side: const BorderSide(color: BaseColors.secondaryColor, width: 1),
          padding: EdgeInsets.only(right: btnRightPadding??5, left: btnLeftPadding??5, top: btnTopPadding??1, bottom: btnBottomPadding??1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 6),
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
            fontSize: fontSize ?? 13,
          ),
        ),
      ),
    );
  }
}
