import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/base_assets.dart';
import '../../../utils/base_colors.dart';
import '../../base_components/base_outlined_button.dart';
import '../../base_components/base_text.dart';

class ManualAddressListTile extends StatelessWidget {
  final String title, subtitle;
  final String? suffixBtnTitle;
  const ManualAddressListTile({super.key, required this.title, required this.subtitle, this.suffixBtnTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 42,
            width: 42,
            padding: const EdgeInsets.symmetric(vertical: 10),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: BaseColors.secondaryColor, width: 1)
            ),
            child: SvgPicture.asset(BaseAssets.icPin, width: 20, height: 20,),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText(
                  value: title,
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                BaseText(
                  value: subtitle,
                  fontSize: 12,
                  color: const Color(0xff30302E),
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          (suffixBtnTitle??"").isNotEmpty ? const BaseOutlinedButton(title: "Hello",) : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
