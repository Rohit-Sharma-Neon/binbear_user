import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class BaseFormFieldValidatorIcon extends StatelessWidget {
  final TextEditingController textEditingController;
  final double? rightMargin, leftMargin;
  final bool failedOn;
  const BaseFormFieldValidatorIcon({super.key, required this.textEditingController, required this.failedOn, this.rightMargin, this.leftMargin});

  @override
  Widget build(BuildContext context) {
    return textEditingController.text.isNotEmpty ? Padding(
      padding: EdgeInsets.only(left: leftMargin??3, right: rightMargin??0),
      child: failedOn ? ZoomIn(child: const Icon(Icons.cancel_outlined, color: Colors.red)) : FadeIn(child: const Icon(Icons.check_circle_outline, color: Colors.green)),
    ) : const SizedBox.shrink();
  }
}