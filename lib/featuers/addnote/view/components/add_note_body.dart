

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memos/core/extentions/textextention.dart';
import 'package:memos/featuers/addnote/controller/cubit/add_cubit.dart';


class add_note_body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCubit, AddState>(
      builder: (context, state) {
         final AddCubit controller = context.read<AddCubit>();
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Form(
                    key: controller.k,
                    child: Column(
                      children: [
                        TextFormField(
                          style: context.tStyle.textTheme.displayLarge,
                          controller:controller.titel,
                          maxLines: 2,
                          maxLength: 10,
                          decoration:  InputDecoration(
                              hintText: 'العنوان',
                              hintStyle: context.tStyle.textTheme.displayLarge,
                              border: InputBorder.none),
                        ),
                        TextFormField(
                          style: context.tStyle.textTheme.displaySmall,
                          controller: controller.note,
                          maxLines: 10000,
                          decoration:  InputDecoration(
                              hintText: 'دون...',
                              hintStyle: context.tStyle.textTheme.displaySmall,
                              border: InputBorder.none),
                          //  maxLines:1000 ,
                        ),
                      ],
                    )),
               
              ],
            ),
          ),
        );
      },
    );
  }
}
