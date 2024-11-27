import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memos/core/theme/cubit/theme_cubit.dart';

import 'package:memos/custom_splash.dart';
import 'package:memos/featuers/addnote/controller/cubit/add_cubit.dart';
import 'package:memos/featuers/addnote/view/page/add_note_page.dart';
import 'package:memos/featuers/favorite/view/page/favoritepage.dart';

import 'package:memos/featuers/home/view/page/hom_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeCubit.themeCubitinstance.apptheme,
        home: const custom_splash(),
        routes: {
          'home': (context) => const home_page(),
          'add': (context) => add_note_page(),
          'favorite': (context) => const Favoritepage()
        },
      ),
    );
  }
}
