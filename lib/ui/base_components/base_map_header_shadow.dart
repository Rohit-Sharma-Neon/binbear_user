import 'package:flutter/material.dart';

class BaseMapHeaderShadow extends StatelessWidget {
  const BaseMapHeaderShadow({super.key});

  @override
  Widget build(BuildContext context) {
    /// Use it with stack
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.9),
            Colors.white.withOpacity(0.6),
            Colors.white.withOpacity(0.4),
            Colors.white.withOpacity(0.1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.2, 0.4, 0.6, 1],
        ),
      ),
    );
  }
}
