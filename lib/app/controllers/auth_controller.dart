import 'package:coshion/app/modules/home/views/home_view.dart';
import 'package:coshion/app/modules/login/views/login_view.dart';
import 'package:coshion/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var uid = "".obs;
  late Rx<User?> firebaseUser;
  FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<String?> idToken;

  @override
  void onInit() {
    super.onInit();
    idToken = Rx<String?>(null);
  }

  @override
  void onReady() async {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    if (user == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => SplashScreenView());
    } else {
      String? token = await user.getIdToken();
      idToken.value = token;
      Get.offAll(() => HomeView());
    }
  }

  void signOut() async {
    await auth.signOut();
  }
}
