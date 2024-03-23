import 'package:binbear/utils/base_functions.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/base_assets.dart';
import '../../../utils/base_colors.dart';

class AddressSearchField extends StatelessWidget {
  final double? leftMargin, rightMargin, topMargin, bottomMargin;
  final TextEditingController controller;
  final Function()? onCloseTap;
  final Function(String)? onChanged;
  const AddressSearchField({super.key, this.leftMargin, this.rightMargin, this.topMargin, this.bottomMargin, required this.controller, required this.onCloseTap, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      margin: EdgeInsets.only(right: rightMargin??horizontalScreenPadding, left: leftMargin??horizontalScreenPadding, bottom: bottomMargin??0, top: topMargin??0),
      decoration: BoxDecoration(
        border: Border.all(color: BaseColors.secondaryColor, width: 0.9),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 1.5,
            color: BaseColors.secondaryColor.withOpacity(0.4),
            offset: const Offset(0,2.5)
          )
        ]
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 15),
        maxLines: 1,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Search...",
          hintStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          counterStyle: const TextStyle(color: Colors.transparent, fontSize: 0),
          counterText: null,
          counter: null,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 10, left: 15),
            child: SvgPicture.asset(BaseAssets.icSearch),
          ),
          suffixIcon: GestureDetector(
            onTap: (){
              triggerHapticFeedback();
              onCloseTap!();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 10),
              child: SvgPicture.asset(BaseAssets.icClose),
            ),
          ),
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
