import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedColumn extends StatelessWidget {
  final List<Widget> children;
  final int? milliseconds;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final double? leftPadding, rightPadding, topPadding, bottomPadding;
  const AnimatedColumn({super.key, required this.children, this.milliseconds, this.crossAxisAlignment, this.mainAxisAlignment, this.mainAxisSize, this.leftPadding, this.rightPadding, this.topPadding, this.bottomPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: rightPadding?? horizontalScreenPadding, left: leftPadding??horizontalScreenPadding),
      child: AnimationLimiter(
        child: Column(
          crossAxisAlignment: crossAxisAlignment??CrossAxisAlignment.center,
          mainAxisAlignment: mainAxisAlignment??MainAxisAlignment.start,
          mainAxisSize: mainAxisSize??MainAxisSize.max,
          children: AnimationConfiguration.toStaggeredList(
            duration: Duration(milliseconds: milliseconds ?? 375),
            childAnimationBuilder: (widget) => SlideAnimation(
              verticalOffset: 50,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: children,
          ),
        ),
      ),
    );
  }
}
