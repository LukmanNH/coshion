import 'package:coshion/app/controllers/outfit_controller.dart';
import 'package:coshion/app/controllers/page_index_controller.dart';
import 'package:coshion/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final pageC = Get.put(PageIndexController(), permanent: true);
  final outfitService = Get.put(OutfitController());

  runApp(
    GetMaterialApp(
      title: "Coshion",
      initialRoute: Routes.SPLASH_SCREEN,
      getPages: AppPages.routes,
    ),
  );
}
