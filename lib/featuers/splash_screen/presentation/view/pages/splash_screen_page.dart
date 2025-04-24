import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/constants/view_constants.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/core/theme/text_styles.dart';
import 'package:notes_app/featuers/splash_screen/presentation/controller/cubit/splash_screen_cubit.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenCubit()..animateText(),
      child: ColoredBox(
          color:  Color(0xff100B20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.folder,
                size: 200,
                color: AppColors.grey1,
              ),
              BlocBuilder<SplashScreenCubit, SplashScreenState>(
                builder: (context, state) {
                  print('rebuild');
                  return AnimatedSlide(
                    duration: ViewConstants.longDuration,
                    offset: state.offset,
                    child: Text(
                      'Daily Notes',
                      style: TextStyles.bold23(context: context)
                          .copyWith(color: AppColors.white),
                    ),
                  );
                },
              )
            ],
          ),
        )
    );
  }
}
