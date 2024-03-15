import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/onboardings/splash/splash_screen.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_localization.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:scaled_app/scaled_app.dart';

void main() async {
  ScaledWidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('MyStorage');
  runAppScaled(const MyApp(), scaleFactor: (deviceSize){
    const double widthOfDesign = 375;
    return deviceSize.width / widthOfDesign;
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BinBear',
      debugShowCheckedModeBanner: false,
      translations: BaseLocalization(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: Column(
            children: [
              Expanded(
                child: LoaderOverlay(
                  useDefaultLoading: false,
                  overlayColor: Colors.black.withOpacity(0.6),
                  overlayWidgetBuilder: (_) {
                    return const Center(
                      child: SpinKitFoldingCube(
                        color: BaseColors.primaryColor,
                        size: 50,
                      ),
                    );
                  },
                  child: child!,
                ),
              ),
              StreamBuilder(
                stream: Connectivity().onConnectivityChanged,
                builder: (BuildContext context, AsyncSnapshot<ConnectivityResult> connectivity) {
                  return Visibility(
                    visible: connectivity.data != ConnectivityResult.mobile && connectivity.data != ConnectivityResult.wifi,
                    child: SizedBox(
                      height: 20,
                      child: Scaffold(
                        backgroundColor: Colors.red,
                        body: Visibility(
                          visible: connectivity.data != ConnectivityResult.mobile && connectivity.data != ConnectivityResult.wifi,
                          child: Container(
                            height: 20,
                            color: (connectivity.data != ConnectivityResult.mobile && connectivity.data != ConnectivityResult.wifi) ? Colors.red : Colors.green.shade800,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            child: const BaseText(
                              value: "No Connection!",
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: BaseColors.primaryColor),
        primaryColor: BaseColors.primaryColor,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.transparent,
        fontFamily: 'NunitoSans',
        pageTransitionsTheme: const PageTransitionsTheme(builders: {TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()}),
      ),
      home: const SplashScreen(),
    );
  }
  
}
