import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseListCheckbox extends StatelessWidget {
  final int itemCount;
  final bool? showMostPopularTag;
  final bool isChecked;
  final String imageUrl, title;
  final String? price;
  final void Function() onTap;
  const BaseListCheckbox({super.key, required this.itemCount, this.showMostPopularTag, required this.imageUrl, required this.title, required this.onTap, required this.isChecked, this.price});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 18, right: horizontalScreenPadding, left: horizontalScreenPadding),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
          border: Border.all(
            width: isChecked ? 2.5 : 0,
            color: isChecked ? BaseColors.secondaryColor : Colors.transparent,
          ),
          boxShadow: [
            BoxShadow(
              spreadRadius: isChecked ? 4: 0,
              blurRadius: isChecked ? 4 : 0,
              offset: const Offset(0,4),
              color: isChecked ? BaseColors.primaryColor.withOpacity(0.8) : Colors.transparent,
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                SvgPicture.asset(
                  imageUrl,
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BaseText(
                      topMargin: 13,
                      bottomMargin: 18,
                      value: title,
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    Visibility(
                      visible: (price??"").isNotEmpty,
                      child: BaseText(
                        topMargin: 13,
                        bottomMargin: 18,
                        value: price??"",
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Visibility(
              visible: showMostPopularTag??false,
              child: Positioned(
                left: -40,
                top: 15,
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(-40 / 360),
                  child: Container(
                    alignment: Alignment.center,
                    color: BaseColors.secondaryColor,
                    height: 28,
                    width: 150,
                    child: const BaseText(
                      value: "Most Popular",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      fontSize: 11,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isChecked,
              child: Positioned(
                  right: 13,
                  top: 13,
                  child: SvgPicture.asset(BaseAssets.icCheck)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

