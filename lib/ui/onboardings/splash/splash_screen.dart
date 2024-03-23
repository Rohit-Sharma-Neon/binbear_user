
import 'package:animate_do/animate_do.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/bookings_tab/controller/bookings_controller.dart';
import 'package:binbear/ui/dashboard_module/dashboard_screen/controller/dashboard_controller.dart';
import 'package:binbear/ui/dashboard_module/dashboard_screen/dashboard_screen.dart';
import 'package:binbear/ui/manual_address/manual_address_screen.dart';
import 'package:binbear/ui/onboardings/splash/controller/base_controller.dart';
import 'package:binbear/ui/onboardings/welcome_screen.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/get_storage.dart';
import 'package:binbear/utils/storage_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  BaseController baseController = Get.put(BaseController());
  DashboardController dashboardController = Get.put(DashboardController());
  bool showFooter = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initGetStorage();
      if (mounted) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
      Future.delayed( const Duration(milliseconds: 2700), () async {
        setState(() {
          showFooter = false;
        });
      });
      Future.delayed( const Duration(seconds: 3), () async {
        if (BaseStorage.read(StorageKeys.apiToken) != null && BaseStorage.read(StorageKeys.apiToken) != "") {
          Get.offAll(() => const DashBoardScreen());
        }else{
          Get.offAll(() => const WelcomeScreen());
        }
      });
    });
  }

  initGetStorage() async {
    await GetStorage.init('MyStorage');
    // BaseStorage.write(StorageKeys.apiToken, "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiOTUyMGZiODI1ZTQyOWU3OTA0N2NjYjkxZTUzMDIxNTVlMmRkYzk4MjliZjVlN2M0MGM2OGNkYTZjZWZkMWIwZjNkMmU1NTY0YmMxMjkxNzYiLCJpYXQiOjE3MTA0ODM4MzguMjk3MDkyLCJuYmYiOjE3MTA0ODM4MzguMjk3MDk1LCJleHAiOjE3NDIwMTk4MzguMjkyNzg1LCJzdWIiOiIxNiIsInNjb3BlcyI6W119.uWUip9PtxAK-B1EYJ1r_r2zLvQNf74QoGZusyxwebq5hOXuOjrHGGr26MAW4UFN2u0AsBraYpp1cNjID5lw9UESlOXUKwwk3RtgA6xPh0SUy8jl0bouSz3uPE9nCxWjZohBpETMeXRY-VMucVTnEMVg8IBlSK3tSr6LtjTlnsWWAaUNR_aMvHLspjfFquDenuj1m8v5AV17pzo8P-NXs1fdEuCDdfXJjQK0rqi0DVttHjSHnub0JGkkIT0DtGzCwCe3htazYRqXNcKHH9j92QxrIVcomSazcMY5chB63nSiUWWpIhgAIEIHWbg-hkESwJfjLHlmwm54HwnA05DMT5OCe6UMvyh-FirohsZ8AP3PR651MHgrefvmdICIrSnQsnmYmbDQiiWIbNc5EqVq0HdgSnznMJKqj3bf8hYDX5LWRLI1Vv7tHeRHhF6hCCa_U1YAUWmbQTV6XewXGWs03UNCu_NkN0QNl104ebi8iLAMW2V5j4Cmex2ueboaOhxPdk0BoD7aovB1ObT1nJLGq9pr5N3fMSY7oEKaoRvEiTs5NzQIdLwwMeD7tWWQ5n5iPRzSDGrCIbw5r-hFCKL4KbS-ECYFy6ga5tthh-gPPML53C4hy6VPSMu2vAqXBoSO6LgMGpAb4RGkR6yFyZWJk46o8soTuB3YTG-d0rbigQ94");
    // BaseStorage.write(StorageKeys.userName, "");
    // BaseStorage.write(StorageKeys.profilePhoto, "");
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
        child: Scaffold(
          body: Column(
            children: [
              const Spacer(),
              ZoomIn(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: BaseStorage.read(StorageKeys.apiToken).toString().isNotEmpty ?
                  Hero(
                    tag: "splash_tag",
                    child: SvgPicture.asset(
                      BaseAssets.appLogoWithName,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ) : SvgPicture.asset(
                    BaseAssets.appLogoWithName,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              const Spacer(),
              FadeInUp(
                animate: showFooter,
                child: SvgPicture.asset(
                  BaseAssets.splashFooter,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
    );
  }
}
