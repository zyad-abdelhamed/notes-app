import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/core/theme/text_styles.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/add_folder_functionality.dart';

class AddFolderButton extends StatelessWidget {
  const AddFolderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
        addFolderFunctionality(context);
      },
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.grey2,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("CreateNewFolder".tr,
                style: TextStyles.semiBold16(context: context)
                    .copyWith(fontSize: 20)),
            Icon(
              Icons.add,
              color: Colors.grey,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}