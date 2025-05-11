import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/core/theme/text_styles.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_category_controller.dart';
import 'package:notes_app/featuers/notes/presentation/controller/notes_by_category_conroller.dart';
import 'package:notes_app/featuers/notes/presentation/view/pages/category_notes_page.dart';

class FolderWidget extends StatelessWidget {
  const FolderWidget({
    super.key,
    required this.name,
    required this.index,
  });
  final String name;
  final int index;

  @override
  Widget build(BuildContext context) {
    final NoteCategoryController controller = Get.find();
    final NotesByCategoryConroller noteByCategoryController = Get.find();
    return GestureDetector(
      onTap: () {
        Get.to(CategoryNotesPage(category:  controller.categories[index], appBarTitle: name));
        noteByCategoryController.getNotesByCategory(controller.categories[index].id);
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
                  ),
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
                ),
                onSelected: (value) {
                  if (value == 'update') {
                    controller.updateCategory(context, index, name: name);
                  } else if (value == 'delete') {
                   
                    controller.deleteCategory(context, categoryId: controller.categories[index].id);
                  }
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 'update',
                    child: Center(
                      child: Text(
                        'update'.tr,
                        style: TextStyle(
                          color: Get.isDarkMode
                              ? AppColors.white
                              : AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Center(
                      child: Text(
                        "Delete".tr,
                        style: TextStyle(
                          color: Get.isDarkMode
                              ? AppColors.white
                              : AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
