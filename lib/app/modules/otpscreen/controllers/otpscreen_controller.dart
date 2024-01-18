// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coshion/app/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpscreenController extends GetxController {
  //TODO: Implement OtpscreenController
  RxBool isLoading = false.obs;
  TextEditingController otpInputController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var authController = Get.find<AuthController>();

  final count = 0.obs;
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

  Future<void> verifyOTP(
      {required String verificationId,
      required String smsCode,
      required Function onSuccess}) async {
    isLoading.value = true;

    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      User user = (await auth.signInWithCredential(creds)).user!;

      if (user != null) {
        authController.uid.value = user.uid;
        onSuccess();
      }

      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(e.code, e.message.toString());
    }
  }

  Future<bool> checkExistingUser() async {
    DocumentSnapshot snapshot =
        await firestore.collection("users").doc(authController.uid.value).get();
    if (snapshot.exists) {
      print("USER EXISTS");
      return true;
    } else {
      print("NEW USER");
      return false;
    }
  }
}
