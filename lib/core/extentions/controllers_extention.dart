import 'package:flutter/material.dart';
import 'package:notes_app/featuers/notes/presentation/controller/cubit/add_cubit.dart';
import 'package:notes_app/featuers/notes/presentation/controller/cubit/home_cubit.dart';

extension ResponsiveExtention on BuildContext {
  NoteCubit get noteController => NoteCubit.getNoteController(this);
  HomeCubit get homeController => HomeCubit.getNoteController(this);
}
