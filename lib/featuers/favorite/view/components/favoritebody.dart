import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memos/core/extentions/textextention.dart';
import 'package:memos/featuers/editnote/view/editnote_page.dart';
import 'package:memos/featuers/favorite/controller/cubit/favorite_cubit.dart';

class Favoritebody extends StatelessWidget {
  const Favoritebody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          final FavoriteCubit controller = context.read<FavoriteCubit>();
          return controller.favorites.isEmpty
              ? Center(
                  child: Text(
                  'no favorits',
                  style: context.tStyle.textTheme.bodyLarge,
                ))
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.favorites.isEmpty
                      ? 0
                      : controller.favorites!.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => editnote_page(
                                  n: controller.favorites[i]['body'],
                                  t: controller.favorites[i]['titel'],
                                 // id: controller.favorites![i]['id'],
                                ),
                              ));
                        },
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        title: Text(
                            controller.favorites[i]['title']??'',
                            style: context.tStyle.textTheme.displayLarge),
                        subtitle: Text(
                         controller.favorites[i]['body']??'',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  });
        },
      ),
    );
  }
}
