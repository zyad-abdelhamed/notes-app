import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:notes_app/core/constants/view_constants.dart';
import 'package:notes_app/core/theme/text_styles.dart';
import 'package:notes_app/featuers/splash_screen/presentation/controller/splash_screen_controller.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});
  static const String _text = 'Daily Notes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 5.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image.asset('assets/notes.png',width: 180,height: 180,),
            GetBuilder<SplashScreenController>(
              builder: (controller) {
                return AnimatedSlide(
                  duration: ViewConstants.longDuration,
                  offset: controller.offset,
                  child: Text(
                    _text,
                    style: TextStyles.bold23(context: context)
                        ,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
