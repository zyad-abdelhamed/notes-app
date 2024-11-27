import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:memos/core/extentions/textextention.dart';
import 'package:memos/featuers/editnote/view/editnote_page.dart';
import 'package:memos/featuers/favorite/controller/cubit/favorite_cubit.dart';
import 'package:memos/featuers/home/controller/cubit/home_cubit.dart';

// ignore: camel_case_types
class home_body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          FavoriteCubit favoriteCubit = FavoriteCubit();
          final HomeCubit controller = context.read<HomeCubit>();
          return Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  controller.search(word: value);
                },
                decoration: const InputDecoration(
                    hintText: 'البحث ضمن ملاحظاتي 🔦',
                    contentPadding: EdgeInsets.only(right: 15)),
              ),
              Expanded(
                child: FutureBuilder(
                    future: controller.readdata(),
                    builder: (context, AsyncSnapshot<List<Map>> snapshot) {
                      return state is Loading
                          ? Center(
                              child: Text(
                              'no memos',
                              style: context.tStyle.textTheme.bodyLarge,
                            ))
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: controller.searchs.isEmpty
                                  ? snapshot.data?.length ?? 0
                                  : controller.searchs.length,
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => editnote_page(
                                              n: snapshot.data![i]['note'],
                                              t: snapshot.data![i]['titel'],
                                              id: snapshot.data![i]['id'],
                                            ),
                                          ));
                                    },
                                    leading: IconButton(
                                        onPressed: () {
                                          if (controller.favoritestarcolor ==
                                              Colors.grey) {
                                            favoriteCubit.addtofavorites(
                                              titel: snapshot.data![i]['titel'],
                                              body: snapshot.data![i]['note'],
                                              // id: snapshot.data![i]['id']
                                            );
                                          } else {
                                            favoriteCubit.removefromfavorite(
                                              titel: snapshot.data![i]['titel'],
                                              body: snapshot.data![i]['note'],
                                              //id: snapshot.data![i]['id']
                                            );
                                          }
                                          controller.changefavoritestarcolor();
                                        },
                                        icon: Theme(
                                          data: ThemeData(
                                              iconTheme: IconThemeData(
                                                  color: controller
                                                      .favoritestarcolor)),
                                          child: const Icon(
                                              CupertinoIcons.star_fill),
                                        )),
                                    trailing: IconButton(
                                        onPressed: () {
                                          controller.changetheme;
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: const Text(
                                                    'متأكد من عمليه الحذف؟'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        controller.deletnote(
                                                            opretion:
                                                                "DELETE FROM notes WHERE id = ${snapshot.data?[i]['id']}");
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('نعم',
                                                          style: context
                                                              .tStyle
                                                              .textTheme
                                                              .bodyMedium)),
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('إلغاء',
                                                          style: context
                                                              .tStyle
                                                              .textTheme
                                                              .bodySmall))
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon: Theme(
                                          data: ThemeData(
                                              iconTheme: const IconThemeData(
                                            size: 30,
                                            color: Colors.red,
                                          )),
                                          child: const Icon(
                                            Icons.delete,
                                          ),
                                        )),
                                    shape: ContinuousRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    title: Text(
                                        controller.searchs.isEmpty
                                            ? '${snapshot.data?[i]['titel'] ?? ''}|'
                                            : '${controller.searchs[i]['titel'] ?? ''}',
                                        style: context
                                            .tStyle.textTheme.displayLarge),
                                    subtitle: Text(
                                      controller.searchs.isEmpty
                                          ? '${snapshot.data?[i]['note'] ?? ''}'
                                          : '${controller.searchs[i]['note'] ?? ''}',
                                      style: context.tStyle.textTheme.bodySmall,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                );
                              },
                            );
                    }),
              ),
            ],
          );
        },
      ),
    );
  }
}
