import 'package:binbear/ui/base_components/base_divider.dart';
import 'package:binbear/ui/base_components/base_shimmer.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:flutter/material.dart';

class NotificationShimmer extends StatelessWidget {
  const NotificationShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      padding: const EdgeInsets.only(right: 15, left: 17),
      shrinkWrap: true,
      itemBuilder: (context, index){
        return const Stack(
          clipBehavior: Clip.none,
          fit: StackFit.loose,
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseShimmer(width: 35, height: 35),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseShimmer(width: double.infinity, height: 18, rightMargin: 160),
                          BaseShimmer(width: double.infinity, height: 13, rightMargin: 45, topMargin: 6),
                          BaseShimmer(width: double.infinity, height: 10, rightMargin: 180, topMargin: 14),
                        ],
                      ),
                    )
                  ],
                ),
                BaseDivider(),
              ],
            ),
            Positioned(
              left: -3,
              top: -8,
              child: BaseShimmer(
                  width: 6,
                  height: 6,
              ),
            )
          ],
        );
      },
    );
  }
}
