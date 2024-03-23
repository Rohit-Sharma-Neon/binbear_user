import 'package:binbear/utils/base_colors.dart';
import 'package:flutter/material.dart';

import 'base_text.dart';

class CustomRadioButton extends StatelessWidget {
  final String title;
  final bool? isSelected;
  final Function() onTap;
  const CustomRadioButton({super.key, required this.title, this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
        margin: const EdgeInsets.only(right: 15, bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: (isSelected??false) ? BaseColors.tertiaryColor : Colors.white,
          border: Border.all(width: 0.5, color: (isSelected??false) ? BaseColors.primaryColor : Colors.white),
          boxShadow: [
            BoxShadow(
              color: (isSelected??false) ? BaseColors.primaryColor.withOpacity(0.5) : Colors.black.withOpacity(0.2),
              blurRadius: 3,
              spreadRadius: 1,
              offset: const Offset(0, 2)
            ),
          ]
        ),
        child: BaseText(
          value: title,
          fontSize: 14,
          color: (isSelected??false) ? BaseColors.primaryColor : Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
