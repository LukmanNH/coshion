import 'package:coshion/app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';

class OnBoardingController extends GetxController {
  RxInt index = 0.obs;

  @override
  void onInit() {
    super.onInit();
    index.value = 0;
  }

  final onboardingPagesList = [
    PageModel(
      widget: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 0.0,
              color: Colors.white,
            ),
          ),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: SizedBox(
                    width: 320,
                    height: 420,
                    child: Image.asset("assets/images/on_board_1.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Center(
                      child: Text(
                        'Welcome to Coshion App',
                        style: textStylePrimaryOnBoard,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Where fashion meets a sustainable future! Our mission is clear - redefine the way you experience daily wear with a curated collection of trendy, comfortable, and eco-friendly clothing.',
                      style: textStyleSecondaryOnBoard,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    PageModel(
      widget: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 0.0,
              color: Colors.white,
            ),
          ),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 420,
                    child: Image.asset("assets/images/on_board_2.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Center(
                      child: Text(
                        'Fashion Redefined',
                        style: textStylePrimaryOnBoard,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Discover a carefully selected array of garments that blend the latest trends with eco-conscious choices. From casual wear to chic ensembles, our collection is designed to make you stand out while contributing to a healthier planet.',
                      style: textStyleSecondaryOnBoard,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    PageModel(
      widget: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 0.0,
              color: Colors.white,
            ),
          ),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 420,
                    child: Image.asset("assets/images/on_board_3.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Center(
                      child: Text(
                        "Let's Join the Movement",
                        style: textStylePrimaryOnBoard,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "At Coshion, we invite you to join a movement that transcends trends. Your journey with us isn't just about renting clothes; it's about making a positive impact on the environment.",
                      style: textStyleSecondaryOnBoard,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ];
}
