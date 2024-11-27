import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memos/core/extentions/textextention.dart';
import 'package:memos/core/theme/cubit/theme_cubit.dart';
import 'package:memos/featuers/addnote/view/page/add_note_page.dart';
import 'package:memos/featuers/home/controller/cubit/home_cubit.dart';
import 'package:memos/featuers/home/view/ccomponents/home_body.dart';

// ignore: camel_case_types
class home_page extends StatelessWidget {
  const home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        final HomeCubit homeCubit = context.read<HomeCubit>();
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'favorite');
                      },
                      icon: Theme(
                          data: ThemeData(
                              iconTheme:
                                  const IconThemeData(color: Colors.green)),
                          child: const Icon(CupertinoIcons.star_fill)))
                ],
                leading: TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return BlocProvider(
                            create: (context) => ThemeCubit(),
                            child: BlocBuilder<ThemeCubit, ThemeState>(
                                builder: (context, state) {
                              ThemeCubit themeCubit =
                                  context.read<ThemeCubit>();
                              return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 1 / 4,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        homeCubit.changetheme();
                                      },
                                      child: Text('تفعيل',
                                          style: context
                                              .tStyle.textTheme.displayMedium),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        homeCubit.changetheme();
                                      },
                                      child: Text('الغاء',
                                          style: context
                                              .tStyle.textTheme.displaySmall),
                                    )
                                  ],
                                ),
                              );
                            }),
                          );
                        },
                      );
                    },
                    child: Text('الوضع الداكن',
                        style: context.tStyle.textTheme.bodySmall)),
                title: Text('ملاحظاتي 📝',
                    style: context.tStyle.textTheme.displayLarge),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => add_note_page(),
                  ));
                },
                child: TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: 4 * 3.14),
                  curve: Curves.bounceIn,
                  duration: const Duration(seconds: 2),
                  builder: (context, value, child) {
                    return Transform.rotate(
                        angle: value,
                        child: Theme(
                            data: ThemeData(
                                iconTheme:
                                    const IconThemeData(color: Colors.white)),
                            child: const Icon(Icons.add)));
                  },
                ),
              ),
              body: home_body()),
        );
      }),
    );
  }
}
