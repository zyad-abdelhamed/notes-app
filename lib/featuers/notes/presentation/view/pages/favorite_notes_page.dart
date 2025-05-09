import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/helper_function/get_widget_depending_on_reuest_state.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/core/widgets/empty_list_widget.dart';
import 'package:notes_app/featuers/notes/presentation/controller/favorite_notes_controller.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/note_widget.dart';

class FavoriteNotesPage extends StatelessWidget {
  const FavoriteNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteNotesController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Favorites".tr),
            actions: [
              Visibility(
                visible: controller.visible,
                maintainState: true,// remove child from widget tree when visible = false
                child: Row(
                  spacing: 5,
                  children: [
                    GestureDetector(
                      onTap: () => controller.removeFromFavorite(),
                      child: Stack(
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 30,
                          ),
                          Transform.rotate(
                              angle: 45,
                              child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: VerticalDivider(thickness: 3)))
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () => noteController.deleteNote(context,
                            note: controller.note, ifRight: () {}),
                        icon: const Icon(CupertinoIcons.delete,
                            color: Colors.grey)),
                  ],
                ),
              )
            ],
          ),
          body: controller.favouriteNotes.isNotEmpty
              ? getWidgetDependingOnReuestState(
                  requestStateEnum: controller.favouriteNotesState,
                  widgetIncaseSuccess: ListView.builder(
                    itemCount: controller.favouriteNotes.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          GestureDetector(
                              onLongPress: () =>
                                  controller.showFavoritesPageAppBarActions(
                                      controller.favouriteNotes[index].id,
                                      controller.favouriteNotes[index],
                                      index),
                              child: NoteWidget(
                                  favoriteIconVisible: false,
                                  note: controller.favouriteNotes[index],
                                  ifRightWhenDelete: () {})),
                          Visibility(
                              visible: controller.visible &&
                                  index == controller.selectedIndex,
                              maintainState: true,
                              child: GestureDetector(
                                onTap: () => controller.hideFavoritesPageAppBarActions(),
                                child: SizedBox(
                                    height: 100,
                                    width: double.infinity,
                                    child: ColoredBox(
                                        color: (Get.isDarkMode
                                                ? AppColors.darkModePrimaryColor
                                                : AppColors
                                                    .lightModePrimaryColor)
                                            .withValues(alpha: .3))),
                              ))
                        ],
                      );
                    },
                  ),
                  erorrMessage: controller.favouriteNotesErrorMessage)
              : Center(
                  child:
                      EmpetyListWidget(text: "there is no favorite notes".tr)));
    });
  }
}
