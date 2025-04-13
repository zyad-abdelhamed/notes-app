import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());
  static HomeCubit getNoteController(BuildContext context) {
    final HomeCubit controller = context.read<HomeCubit>();
    return controller;
  }
}
