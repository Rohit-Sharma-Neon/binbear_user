import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';

class PaymentGatewayScreen extends StatefulWidget {
  const PaymentGatewayScreen({super.key});

  @override
  State<PaymentGatewayScreen> createState() => _PaymentGatewayScreenState();
}

class _PaymentGatewayScreenState extends State<PaymentGatewayScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        WebviewScaffold(
          url: "https://v1.checkprojectstatus.com/binbear/stripe-payment/57/13",
          withZoom: true,
          withLocalStorage: true,
          // hidden: false,
          initialChild: Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            color: const Color(0xffba6e1f),
            child: const Center(
              child: SpinKitFoldingCube(
                color: BaseColors.primaryColor,
                size: 50,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
