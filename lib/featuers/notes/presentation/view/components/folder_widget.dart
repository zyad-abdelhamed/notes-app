import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/core/theme/text_styles.dart';
import 'package:notes_app/core/widgets/delete_alert_dialog.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_category_controller.dart';
import 'package:notes_app/featuers/notes/presentation/controller/notes_by_category_conroller.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/app_text_field.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/custom_alert_dialog.dart';
import 'package:notes_app/featuers/notes/presentation/view/pages/category_notes_page.dart';

class FolderWidget extends StatelessWidget {
  const FolderWidget({
    super.key,
    required this.name,
    required this.id,
  });
  final String name;
  final int id;

  @override
  Widget build(BuildContext context) {
    final NoteCategoryController controller = Get.find();
      final NotesByCategoryConroller noteController = Get.find();

    return GestureDetector(
      onTap: () {
        Get.to(CategoryNotesPage(categoryId: id));
         noteController.getNotesByCategory(id);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.blueGrey,
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.folder,
                    size: 80,
                    color: Get.isDarkMode
                        ? AppColors.darkModePrimaryColor
                        : AppColors.lightModePrimaryColor,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyles.semiBold16(context: context),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: PopupMenuButton<String>(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ),
                onSelected: (value) {
                  if (value == 'update') {
                                      controller.categoryNameController.text = name;
      
                    showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                  contentWidget: (context) => Form(
                    key: controller.categoryFormKey,
                    child: appTextField(
                        context: context,
                        titleHintText: '',
                        hintStyle: TextStyles.semiBold16(context: context),
                        controller: controller.categoryNameController,
                        maxLines: 2,
                        maxLength: 31),
                  ),
                  onTap: () {
                    controller
                        .updateCategory(id, controller.categoryNameController.text);
                    
                  },
                  buttonText: 'update'.tr,
                  title: 'update category'));
                  } else if (value == 'delete') {
                    showDeleteConfirmationDialog(
                      onConfirm: () => controller.deleteCategory(id),
                    );
                  }
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 'update',
                    child: Center(
                      child: Text(
                        'update'.tr,
                        style: TextStyle(
                          color:
                              Get.isDarkMode ? AppColors.white : AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Center(
                      child: Text(
                        'delete'.tr,
                        style: TextStyle(
                          color:
                              Get.isDarkMode ? AppColors.white : AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ],
                color: Get.isDarkMode ? AppColors.grey : AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
