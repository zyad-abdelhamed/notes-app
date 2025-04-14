import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_app/core/constants/view_constants.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(const SplashScreenState());
  void animateText(){
    Future.delayed(ViewConstants.lowDuration,() => emit(SplashScreenState(offset: Offset.zero)));
      
  }
}
