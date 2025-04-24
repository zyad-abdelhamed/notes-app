import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:notes_app/featuers/notes/presentation/controller/cubit/add_cubit.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/add_note_form.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "AddNote".tr,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.done,
                ))
          ],
        ),
        body: AddNoteForm(),
      ),
    );
  }
}
