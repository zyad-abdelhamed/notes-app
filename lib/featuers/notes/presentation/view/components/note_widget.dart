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
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.blueGrey),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyles.bold23(context: context),
          ),
          Text(
            descreption,
            maxLines: 15,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.regular14_150(context),
          ),
        ],
      ),
    );
  }
}
