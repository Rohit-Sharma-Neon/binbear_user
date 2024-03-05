import 'package:binbear/utils/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

BottomNavigationBarItem bottomNavigationBarItem({required String icon, required String title}){
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.only(top: 11),
      child: SvgPicture.asset(icon, color: const Color(0xff330601)),
    ),
    activeIcon: Padding(
      padding: const EdgeInsets.only(top: 11),
      child: SvgPicture.asset(icon, color: BaseColors.primaryColor,),
    ),
    label: title.tr,
  );
}
