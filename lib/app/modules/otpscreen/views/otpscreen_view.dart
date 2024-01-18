import 'dart:math';

import 'package:coshion/app/constant/color.dart';
import 'package:coshion/app/modules/home/views/home_view.dart';
import 'package:coshion/app/widgets/customButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pinput/pinput.dart';

import '../../../routes/app_pages.dart';
import '../controllers/otpscreen_controller.dart';

class OtpscreenView extends GetView<OtpscreenController> {
  // String verificationId;
  var data = Get.arguments;
  OtpscreenView({
    Key? key,
  }) : super(key: key);

  var otpController = Get.put(OtpscreenController());

  @override
  Widget build(BuildContext context) {
    String? otpcode;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verify Phone',
          style: textStylePrimaryOnBoard,
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(height: 20.0),
          Text(
            "A 6-digit code was sent to +62 ${data[0]}",
            style: textStyleSecondaryOnBoard,
          ),
          const SizedBox(height: 90.0),
          Pinput(
            length: 6,
            showCursor: true,
            defaultPinTheme: PinTheme(
              width: 45,
              height: 57,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFF2E4F4F),
                ),
              ),
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            controller: otpController.otpInputController,
            // onSubmitted: (value) {
            //   otpcode = otpController.otpInputController.text;
            // },
          ),
          const SizedBox(height: 90),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Didn't receive code? ",
                  style: TextStyle(fontSize: 12),
                ),
                TextSpan(
                  text: "Request Code",
                  style: TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                    decorationColor: colorPrimary,
                    color: colorPrimary,
                  ),
                ),
                TextSpan(
                  text: " in ",
                  style: TextStyle(fontSize: 12),
                ),
                TextSpan(
                  text: "00:30",
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF2E4F4F),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: "Continue",
                isPrimary: true,
                onPressed: () async {
                  otpController.verifyOTP(
                      verificationId: data[1],
                      smsCode: otpController.otpInputController.text,
                      onSuccess: () {
                        Get.offAndToNamed(Routes.HOME);
                      }
                      // onSuccess: () {
                      //   otpController.checkExistingUser().then((value) => {
                      //         if (value == true)
                      //           {
                      //             Get.snackbar("User Ada",
                      //                 "User telah terdaftar di coshion")
                      //           }
                      //         else
                      //           {
                      //             Get.snackbar(
                      //                 "User Belum Terdaftar", "OTW MENDAFTARKAN")
                      //           }
                      //       });
                      );
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}
