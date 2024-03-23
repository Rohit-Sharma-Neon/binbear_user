import 'package:binbear/utils/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SmartRefresherBaseHeader extends StatelessWidget {
  const SmartRefresherBaseHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const WaterDropHeader(waterDropColor: BaseColors.primaryColor);
  }
}
