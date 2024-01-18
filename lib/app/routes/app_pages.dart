import 'package:get/get.dart';

import '../modules/bookmark/bindings/bookmark_binding.dart';
import '../modules/bookmark/views/bookmark_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/detail_outfit/bindings/detail_outfit_binding.dart';
import '../modules/detail_outfit/views/detail_outfit_view.dart';
import '../modules/explore/bindings/explore_binding.dart';
import '../modules/explore/views/explore_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/on_boarding/bindings/on_boarding_binding.dart';
import '../modules/on_boarding/views/on_boarding_view.dart';
import '../modules/on_progress/bindings/on_progress_binding.dart';
import '../modules/on_progress/views/on_progress_view.dart';
import '../modules/order/bindings/order_binding.dart';
import '../modules/order/views/order_view.dart';
import '../modules/otpscreen/bindings/otpscreen_binding.dart';
import '../modules/otpscreen/views/otpscreen_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.ON_PROGRESS,
      page: () => OnProgressView(),
      binding: OnProgressBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_OUTFIT,
      page: () => DetailOutfitView(),
      binding: DetailOutfitBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.OTPSCREEN,
      page: () => OtpscreenView(),
      binding: OtpscreenBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => const OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => OrderView(),
      binding: OrderBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.EXPLORE,
      page: () => ExploreView(),
      binding: ExploreBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.BOOKMARK,
      page: () => BookmarkView(),
      binding: BookmarkBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
