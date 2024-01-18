import 'package:coshion/app/constant/color.dart';
import 'package:coshion/app/modules/otpscreen/views/otpscreen_view.dart';
import 'package:coshion/app/routes/app_pages.dart';
import 'package:coshion/app/widgets/customButton.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  var loginController = Get.put(LoginController());

  final selectedCountry = Get.put(LoginController().country);
  final isLoading = Get.put(LoginController().isLoading);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: (SvgPicture.asset("assets/icons/arrow_left.svg")),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          "Sign Up to Coshion",
          style: textStylePrimaryOnBoard,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Enter your phone number, and you will receive a 6 digit OTP code",
              style: textStyleSecondaryOnBoard,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller.phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Enter phone Number",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Obx(
                    () => InkWell(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme: const CountryListThemeData(
                            bottomSheetHeight: 520,
                          ),
                          onSelect: (value) {
                            selectedCountry.value = value;
                          },
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: selectedCountry.value.flagEmoji,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            const WidgetSpan(
                              child: Icon(Icons.keyboard_arrow_down),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Obx(
              () => SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: isLoading.value ? "Please wait..." : "Continue",
                  isPrimary: true,
                  onPressed: () => controller.signIn(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
