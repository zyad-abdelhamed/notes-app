import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/core/constants/view_constants.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/core/theme/text_styles.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/presentation/controller/favorite_notes_controller.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_controller.dart';

final NoteController noteController = Get.find();

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key, required this.note, this.favoriteIconVisible = true, this.index, required this.ifRightWhenDelete});
  final Note note;
  final bool favoriteIconVisible;
  final int? index;
  final VoidCallback ifRightWhenDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => noteController.goToNotePage(note),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            boxShadow: ViewConstants.shadow,
            color: Get.isDarkMode ? AppColors.black : AppColors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: TextStyles.bold23(context: context),
            ),
            Text(
              note.descreption,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.regular14_150(context),
            ),
            NoteInfoWidget(
              index: index ?? 0,
              note: note,
              ifRightWhenDelete: ifRightWhenDelete,
              favoriteIconVisible: favoriteIconVisible,
            )
          ],
        ),
      ),
    );
  }
}

class NoteInfoWidget extends StatelessWidget {
  const NoteInfoWidget(
      {super.key, required this.note, required this.ifRightWhenDelete, this.favoriteIconVisible = true,required this.index});
  final Note note;
  final bool favoriteIconVisible;
  final VoidCallback ifRightWhenDelete;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Text(
        data,
        style: TextStyles.regular12(context).copyWith(color: Colors.grey),
      ),
      Spacer(),
      Visibility(
        visible: favoriteIconVisible,
        child: IconButton(
            onPressed: () => noteController.deleteNote(context,
                note: note, ifRight: ifRightWhenDelete),
            icon: const Icon(CupertinoIcons.delete, color: Colors.grey)),
      ),
      Visibility(
        visible: favoriteIconVisible,
        child: GetBuilder<FavoriteNotesController>(
            builder: (controller) =>  IconButton(
                    style: ButtonStyle(enableFeedback: false),
                    onPressed: () => controller.toggleFavorite(index: index,
                        controller.favouriteNotesIds.contains(note.id) ? 0 : 1,
                        note.id),
                    icon: AnimatedScale(
                        duration: ViewConstants.mediumDuration,
                        scale: index == controller.selectedIndex ? 0.8 : 1.3,
                        child: controller.favouriteNotesIds.contains(note.id)
                            ? const Icon( Icons.favorite,
                            color: Colors.red,)
                            : const Icon(
                                Icons.favorite_outline,
                                color: Colors.grey,
                              )))
        ),
      )
    ]);
  }

  String get data {
    DateTime createdAt = DateTime.parse(note.createdAt);

    String formattedCreatedDate = DateFormat('yyyy-MM-dd').format(createdAt);
    String formattedCreatedTime = DateFormat('HH:mm').format(createdAt);

    String result =
        '${"createdAt".tr} $formattedCreatedDate $formattedCreatedTime';

    if (note.lastUpdate != null) {
      DateTime lastUpdatedAt = DateTime.parse(note.lastUpdate!);
      String formattedUpdatedDate =
          DateFormat('yyyy-MM-dd').format(lastUpdatedAt);
      String formattedUpdatedTime = DateFormat('HH:mm').format(lastUpdatedAt);
      result +=
          '\n${"lastUpdate".tr} $formattedUpdatedDate $formattedUpdatedTime';
    }

    return result;
  }
}
