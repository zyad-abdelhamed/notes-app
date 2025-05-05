import 'dart:ui';
import 'package:get/get.dart';
import 'package:notes_app/core/constants/routes_constants.dart';

class SplashScreenController extends GetxController {
  Offset offset = const Offset(0, 3);

  void animateText() {
    offset = const Offset(0, 0);
    update();
    Future.delayed(const Duration(seconds: 2), () => goToHomePage());
  }

  void goToHomePage() => Get.offAndToNamed(RoutesConstants.homePageRouteName);

  @override
  void onReady() {
    animateText();
    super.onReady();
  }
}
