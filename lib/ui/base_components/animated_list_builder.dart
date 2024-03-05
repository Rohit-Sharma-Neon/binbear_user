import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedListBuilder extends StatelessWidget {
  final int index;
  final Widget child;
  final int? milliseconds;
  const AnimatedListBuilder({super.key, required this.index, required this.child, this.milliseconds});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: Duration(milliseconds: milliseconds??375),
      child: SlideAnimation(
        verticalOffset: 50,
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }
}
