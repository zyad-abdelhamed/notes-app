import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/core/theme/text_styles.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_category_controller.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/app_text_field.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/custom_alert_dialog.dart';

class AddFolderButton extends StatelessWidget {
  const AddFolderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    NoteCategoryController controller = Get.find();
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => CustomAlertDialog(
                contentWidget: (context) => Form(
                  key: controller.categoryFormKey,
                  child: appTextField(
                      context: context,
                      titleHintText: "Enter category name",
                      hintStyle: TextStyles.semiBold16(context: context),
                      controller: controller.categoryNameController,
                      maxLines: 2,
                      maxLength: 31),
                ),
                onTap: () {
                  controller
                      .addCategory(controller.categoryNameController.text);
                  
                },
                buttonText: 'add',
                title: 'add category'));
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
