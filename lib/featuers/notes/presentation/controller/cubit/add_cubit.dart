import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'add_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteState());
  TextEditingController addTitelTextFieldController =TextEditingController();
  TextEditingController addDescreptionTextFieldController =TextEditingController();
  GlobalKey addFormKey=GlobalKey<FormState>();
  static NoteCubit getNoteController(BuildContext context) {
    final NoteCubit controller = context.read<NoteCubit>();
    return controller;
  }
  

}
