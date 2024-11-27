import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memos/core/extentions/textextention.dart';
import 'package:memos/featuers/addnote/controller/cubit/add_cubit.dart';
import 'package:memos/featuers/addnote/view/components/add_note_body.dart';

class add_note_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCubit, AddState>(
      builder: (context, state) {
         final AddCubit controller = context.read<AddCubit>();
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              appBar: AppBar(
                title:  Text(
                  'إضافة ملاحظه',
                  style:context.tStyle.textTheme.bodyLarge
                ),
                actions: [
                  IconButton(
                      onPressed: () {controller.addf(context);},
                      icon: const Icon(
                        Icons.done,
                      ))
                ],
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    )),
              ),
              body: add_note_body()),
        );
      },
    );
  }
}
