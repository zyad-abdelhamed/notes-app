import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:memos/core/theme/dark/darkthemedata.dart';
import 'package:memos/core/theme/light/lightthemedata.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
 static ThemeCubit themeCubitinstance =ThemeCubit();
  ThemeData apptheme = getlighttheme;
  t(){
 if(apptheme==getlighttheme){
      apptheme = getdarktheme;
    }else{
      apptheme = getlighttheme;
    }
  }
  changetheme(BuildContext context){
   // Navigator.pop(context);
   t();
    emit(Changethemestate());
  }
}