import 'dart:math';

import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController phoneController = TextEditingController();

  Rx<Country> country = Country(
    phoneCode: "62",
    countryCode: "ID",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Indonesia",
    example: "Indonesia",
    displayName: "Indonesia",
    displayNameNoCountryCode: "ID",
    e164Key: "",
  ).obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> signIn() async {
    isLoading.value = true;
    try {
      isLoading.value = true;
      var trySignIn = auth.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar(
            "Oops..",
            e.message.toString(),
            snackPosition: SnackPosition.BOTTOM,
          );
        },
        codeSent: (String verificationId, int? forceResendingToken) {
          Get.toNamed(
            "/otpscreen",
            arguments: [phoneController.value.text, verificationId],
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: "+${country.value.phoneCode}${phoneController.value.text}",
      );
      print(trySignIn);
      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      print(e.message.toString());
      Get.snackbar(
        "Error Login",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      isLoading.value = false;
    }
  }
}
