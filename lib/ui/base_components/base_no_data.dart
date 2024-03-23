import 'package:binbear/utils/base_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

import 'base_text.dart';

class BaseNoData extends StatelessWidget {
  final String? message;
  final Color? textColor;
  const BaseNoData({super.key, this.message, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 100,
              child: OverflowBox(
                minHeight: 160,
                maxHeight: 160,
                minWidth: 160,
                maxWidth: 160,
                  child: Lottie.asset(
                      BaseAssets.noDataLottieJson,
                  ),
              ),
          ),
          BaseText(
            value: message??"No Data Found!",
            fontSize: 16,
            color: textColor??Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
