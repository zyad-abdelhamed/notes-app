import 'package:bloc/bloc.dart';
import 'package:memos/core/theme/cubit/theme_cubit.dart';

import 'package:memos/sqldp.dart';
import 'package:meta/meta.dart';

import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    loadtheme;
  }

  changetheme() {
    ThemeCubit.themeCubitinstance.changetheme;
    emit(Converttodarktheme());
  }

  static ThemeMode? apptheme = ThemeMode.light;
  changetheme1() {
    apptheme = ThemeMode.dark;
    loadtheme;
    emit(Converttodarktheme());
  }

  ThemeMode? get loadtheme {
    return apptheme;
  }

  Color favoritestarcolor = Colors.grey;
  changefavoritestarcolor() {
    if (favoritestarcolor == Colors.grey) {
      favoritestarcolor = Colors.green;
    } else {
      favoritestarcolor = Colors.grey;
    }
    emit(Changefavoritestarcolorstate());
  }

  bool switchstate = true;
  changeswitchstate(bool state) {
    switchstate = state;
    emit(Switchchange());
  }

  List<Map> res = [];
  Future<List<Map>> readdata() async {
    res = await SqlDb.stobject.readData("SELECT * FROM notes");
    if (res.length == 0) {
      emit(Loading());
    }
    return res;
  }

  Future<void> deletnote({required String opretion}) async {
    await SqlDb.stobject.deleteData(opretion);
    emit(Deletn());
  }

  List<Map> searchs = [];
  Future<List<Map>> search({String? word}) async {
    searchs = await res
        .where((element) => element['titel'].toString().startsWith(word ?? ''))
        .toList();
    emit(Searchn());
    return searchs;
  }
}
