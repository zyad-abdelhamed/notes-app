import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notes_app/core/constants/view_constants.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/core/theme/text_styles.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key});

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
            'hello world',
            style: TextStyles.bold23(context: context),
          ),
          Text(
            'hello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhelloworldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello world',
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.regular14_150(context),
          ),
          NoteInfoWidget()
        ],
      ),
    );
  }
}

class NoteInfoWidget extends StatelessWidget {
  const NoteInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const List<IconData> icons = <IconData>[Icons.star, CupertinoIcons.delete];
    const List<Color> iconsColor = <Color>[
      AppColors.featuredIconColor,
      Colors.grey
    ];
    return Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      ...List.generate(
        2,
        (index) => IconButton(
            onPressed: () {},
            icon: Icon(
              icons[index],
              color: iconsColor[index],
            )),
      ),
      Spacer(),
      Text(
        '${DateTime.now()}',
        style: TextStyles.regular14_150(context).copyWith(color: Colors.grey),
      )
    ]);
  }
}
