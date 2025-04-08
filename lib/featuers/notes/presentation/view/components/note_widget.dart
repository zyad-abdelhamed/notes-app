import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/core/theme/text_styles.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key, required this.title, required this.descreption});
  final String title;
  final String descreption;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: AppColors.grey),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyles.bold23(context: context),
          ),
          Text(
            descreption,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.semiBold16(context: context),
          ),
        ],
      ),
    );
  }
}
