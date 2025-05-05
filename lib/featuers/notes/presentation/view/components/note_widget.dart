import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/core/constants/view_constants.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/core/theme/text_styles.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/presentation/controller/featured_notes_controller.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key, required this.note});
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            note: note,
          )
        ],
      ),
    );
  }
}

class NoteInfoWidget extends StatelessWidget {
  const NoteInfoWidget({super.key, required this.note});
  final Note note;
  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(
        data,
        style: TextStyles.regular12(context).copyWith(color: Colors.grey),
      ),
      Spacer(),
      IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.delete, color: Colors.grey)),
      GetBuilder<FeaturedNotesController>(
        builder: (controller) => IconButton(
            onPressed: () =>
                controller.toggleFavorite(note.isFeatured ? 0 : 1, note.id),
            icon: AnimatedScale(
                duration: ViewConstants.longDuration,
                scale: controller.scale,
                child: Icon(note.isFeatured ? Icons.star : Icons.star_outline,
                    color: note.isFeatured
                        ? AppColors.featuredIconColor
                        : Colors.grey))),
      ),
    ]);
  }

  String get data {
    DateTime createdAt = DateTime.parse(note.createdAt);

    String formattedCreatedDate = DateFormat('yyyy-MM-dd').format(createdAt);
    String formattedCreatedTime = DateFormat('HH:mm').format(createdAt);

    String result =
        'تاريخ الانشاء: $formattedCreatedDate $formattedCreatedTime';

    if (note.lastUpdate != null) {
      DateTime lastUpdatedAt = DateTime.parse(note.lastUpdate!);
      String formattedUpdatedDate =
          DateFormat('yyyy-MM-dd').format(lastUpdatedAt);
      String formattedUpdatedTime = DateFormat('HH:mm').format(lastUpdatedAt);
      result += '\nآخر تحديث: $formattedUpdatedDate $formattedUpdatedTime';
    }

    return result;
  }
}
