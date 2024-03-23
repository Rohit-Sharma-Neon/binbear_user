import 'package:binbear/utils/base_assets.dart';
import 'package:flutter/material.dart';
import 'package:scaled_app/scaled_app.dart';

class BaseScaffoldBackground extends StatelessWidget {
  final Widget child;
  const BaseScaffoldBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(BaseAssets.bgScaffold),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
