import 'package:binbear/utils/base_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scaled_app/scaled_app.dart';

class BaseScaffoldChatBackground extends StatelessWidget {
  final Widget child;
  const BaseScaffoldChatBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).scale(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(BaseAssets.bgScaffold),
                fit: BoxFit.fill,
              ),
            ),
            child: child,
          ),
          Image.asset(
            "assets/images/launcher_icon_final.png",
            opacity: const AlwaysStoppedAnimation(
                0.15,
            ),
          ),
        ],
      ),
    );
  }
}
