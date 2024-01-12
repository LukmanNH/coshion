import 'dart:math';

import 'package:coshion/app/modules/home/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../controllers/otpscreen_controller.dart';

class OtpscreenView extends GetView<OtpscreenController> {
  String verificationId;
  OtpscreenView({Key? key, required this.verificationId}) : super(key: key);

  // OtpFieldController otpController = OtpFieldController();
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OtpscreenView'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          // OTPTextField(
          //   controller: otpController,
          //   length: 5,
          //   width: MediaQuery.of(context).size.width,
          //   fieldWidth: 50,
          //   style: TextStyle(fontSize: 17),
          //   textFieldAlignment: MainAxisAlignment.spaceAround,
          //   fieldStyle: FieldStyle.underline,
          //   onCompleted: (pin) {
          //     print("Completed: " + pin);
          //   },
          // ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'OTP',
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
            controller: otpController,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              try {
                PhoneAuthCredential credential =
                    await PhoneAuthProvider.credential(
                        verificationId: verificationId,
                        smsCode: otpController.text.toString());
                FirebaseAuth.instance
                    .signInWithCredential(credential)
                    .then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeView()));
                });
              } catch (e) {
                print(e);
              }
            },
            child: Text("OTP"),
          ),
        ],
      )),
    );
  }
}
