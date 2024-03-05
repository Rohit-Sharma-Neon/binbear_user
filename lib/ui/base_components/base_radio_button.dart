import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/material.dart';

class BaseRadioButton extends StatelessWidget {
  final String value, selectedValue;
  final void Function() onTap;
  const BaseRadioButton({super.key, required this.value, required this.selectedValue, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        triggerHapticFeedback();
        onTap();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 19,
            height: 19,
            child: Radio<String>(
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: value,
              activeColor: BaseColors.secondaryColor,
              fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  return BaseColors.secondaryColor;
                },
              ),
              groupValue: selectedValue,
              onChanged: null
            ),
          ),
          BaseText(
            leftMargin: 7,
            value: value,
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
