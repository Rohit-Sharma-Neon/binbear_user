import 'package:binbear/ui/base_components/base_shimmer.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/material.dart';

class BaseGoogleAddressShimmer extends StatelessWidget {
  final int? itemCount;
  final double? topMargin, rightMargin, leftMargin, bottomMargin;
  const BaseGoogleAddressShimmer({super.key, this.itemCount, this.topMargin, this.rightMargin, this.leftMargin, this.bottomMargin});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount??1,
      padding: EdgeInsets.only(top: topMargin??0, bottom: bottomMargin??0, right: rightMargin??18, left: leftMargin??horizontalScreenPadding),
      itemBuilder: (context, index){
        return const Padding(
          padding: EdgeInsets.only(bottom: 12, top: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            BaseShimmer(
              width: 42,
              height: 42,
              borderRadius: 10,
              rightMargin: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseShimmer(
                    width: double.infinity,
                    height: 18,
                    rightMargin: 150,
                  ),
                  BaseShimmer(
                    topMargin: 7,
                    width: double.infinity,
                    height: 11,
                  ),
                  BaseShimmer(
                    topMargin: 2,
                    width: double.infinity,
                    height: 11,
                    rightMargin: 200,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
        },
    );
  }
}
