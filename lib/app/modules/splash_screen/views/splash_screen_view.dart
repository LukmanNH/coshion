import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:coshion/app/constant/color.dart';
import 'package:coshion/app/modules/on_boarding/controllers/on_boarding_controller.dart';
import 'package:coshion/app/modules/on_boarding/views/on_boarding_action_view.dart';
import 'package:coshion/app/modules/on_boarding/views/on_boarding_view.dart';
import 'package:coshion/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  SplashScreenView({Key? key}) : super(key: key);
  final onBoardC = Get.put(OnBoardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.scale(
        backgroundColor: colorSecondary,
        childWidget: SizedBox(
          height: 300,
          child: Image.asset("assets/images/logo.png"),
        ),
        duration: const Duration(milliseconds: 1500),
        animationDuration: const Duration(milliseconds: 1000),
        onAnimationEnd: () => debugPrint("On Scale End"),
        nextScreen: Scaffold(
          body: Onboarding(
            pages: onBoardC.onboardingPagesList,
            onPageChange: (int pageIndex) {
              onBoardC.index.value = pageIndex;
            },
            startPageIndex: 0,
            footerBuilder: (context, dragDistance, pagesLength, setIndex) {
              return Container(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(45.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIndicator(
                          netDragPercent: dragDistance,
                          pagesLength: pagesLength,
                          indicator: Indicator(
                            closedIndicator:
                                const ClosedIndicator(color: Color(0xFFD9D9D9)),
                            indicatorDesign: IndicatorDesign.polygon(
                              polygonDesign: PolygonDesign(
                                polygon: DesignType.polygon_circle,
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () {
                            return Material(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6)),
                              color: colorPrimary,
                              child: InkWell(
                                borderRadius: defaultProceedButtonBorderRadius,
                                onTap: () {
                                  if (onBoardC.index.value == pagesLength - 1) {
                                    Get.to(const OnBoardingActionView());
                                  } else {
                                    onBoardC.index.value = 2;
                                    setIndex(2);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 26,
                                    vertical: 12,
                                  ),
                                  child: Text(
                                    onBoardC.index.value == pagesLength - 1
                                        ? "Signup Now"
                                        : "Skip",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: "Satoshi",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
