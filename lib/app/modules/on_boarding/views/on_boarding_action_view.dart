import 'package:coshion/app/constant/color.dart';
import 'package:coshion/app/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingActionView extends StatelessWidget {
  const OnBoardingActionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset("assets/images/on_board.png"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 32.0),
                  Text(
                    "Welcome to Coshion App",
                    style: textStylePrimaryOnBoard,
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "At Coshion, we invite you to join a movement that transcends trends. Register now to start using Cushion, or log in if you already have an account",
                    style: textStyleSecondaryOnBoard,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 42.0),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: "Signup For New Member",
                      onPressed: () {
                        Get.toNamed("/login");
                      },
                      isPrimary: true,
                    ),
                  ),
                  const SizedBox(height: 14.0),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: "Login Now",
                      onPressed: () {
                        Get.toNamed("/login");
                      },
                      isPrimary: false,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
