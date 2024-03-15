import 'package:binbear/ui/base_components/listview_builder_animation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class IntroductoryShimmer extends StatelessWidget {
  const IntroductoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 10, right: 36, left: 36),
      itemBuilder: (context, index){
        return ListviewBuilderAnimation(
          index: index,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade400,
            period: const Duration(milliseconds: 100),
            child: Container(
                width: double.infinity,
                height: 135,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
                )
            ),
          ),
        );
      },
    );
  }
}
