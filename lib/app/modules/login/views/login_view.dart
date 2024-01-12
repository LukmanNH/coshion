import 'package:coshion/app/modules/home/views/home_view.dart';
import 'package:coshion/app/modules/otpscreen/views/otpscreen_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign In",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: "+62----",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                controller: phoneController,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.verifyPhoneNumber(
                    verificationCompleted: (PhoneAuthCredential credentials) {},
                    verificationFailed: (FirebaseAuthException ex) {},
                    codeSent: (String verificationId, int? resendToken) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpscreenView(
                            verificationId: verificationId,
                          ),
                        ),
                      );
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                    phoneNumber: phoneController.text.toString(),
                  );
                },
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
