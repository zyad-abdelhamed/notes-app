import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/utils/enums/request_state_enum.dart';
import 'package:notes_app/core/erorr/failure.dart';
import 'package:notes_app/core/theme/text_styles.dart';
import 'package:notes_app/core/widgets/custom_snake_bar.dart';
import 'package:notes_app/core/widgets/delete_alert_dialog.dart';
import 'package:notes_app/featuers/notes/domain/entities/note_category.dart';
import 'package:notes_app/featuers/notes/domain/repos/base_note_category_repo.dart';
import 'package:notes_app/featuers/notes/presentation/controller/get_all_notes.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/app_text_field.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/custom_alert_dialog.dart';

class NoteCategoryController extends GetxController {
  NoteCategoryController({required this.baseNoteCategoryRepo});
  final BaseNoteCategoryRepo baseNoteCategoryRepo;
  final GetAllNotesController getAllNotesController = Get.find();
  // Controllers & Variables
  TextEditingController categoryNameController = TextEditingController();
  GlobalKey<FormState> categoryFormKey = GlobalKey<FormState>();
  List<NoteCategory> categories = [];
  RequestStateEnum fetchState = RequestStateEnum.loading;
  String errorMessage = '';
  // CRUD Operations
  void fetchAllCategories() async {
    fetchState = RequestStateEnum.loading;
    update();
    final result = await baseNoteCategoryRepo.getAllCategories();
    result.fold(
      (Failure failure) {
        errorSnackBar(message: failure.message);
        errorMessage = failure.message;
        fetchState = RequestStateEnum.failed;
        update();
      },
      (List<NoteCategory> categoryNames) {
        categories = categoryNames;
        fetchState = RequestStateEnum.success;
        update();
      },
    );
  }

  void addCategory(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
            contentWidget: (context) => Form(
                  key: categoryFormKey,
                  child: appTextField(
                      context: context,
                      titleHintText: "Enter category name".tr,
                      hintStyle: TextStyles.regular14_150(context)
                          .copyWith(color: Colors.grey),
                      style: TextStyles.semiBold16(context: context),
                      controller: categoryNameController,
                      maxLines: 2,
                      maxLength: 31),
                ),
            onTap: () async {
              if (categoryFormKey.currentState!.validate()) {
                final result = await baseNoteCategoryRepo
                    .insertCategory(categoryNameController.text);
                result.fold(
                  (Failure failure) {},
                  (_) {
                    categoryNameController.clear();
                    fetchAllCategories();
                    Get.back();
                    update();
                  },
                );
              }
            },
            buttonText: "add".tr,
            title: '${"add".tr} ${"folder".tr}'));
  }

  void updateCategory(BuildContext context, int index, {required String name}) {
    categoryNameController.text = name;

    showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
            contentWidget: (context) => Form(
                  key: categoryFormKey,
                  child: appTextField(
                      context: context,
                      titleHintText: '',
                      hintStyle: TextStyles.semiBold16(context: context),
                      controller: categoryNameController,
                      maxLines: 2,
                      maxLength: 31),
                ),
            onTap: () async {
              if (categoryFormKey.currentState!.validate()) {
                final result = await baseNoteCategoryRepo.updateCategory(
                    categories[index].id, categoryNameController.text);
                result.fold(
                  (Failure failure) {
                    errorSnackBar(message: failure.message);
                  },
                  (_) {
                    categoryNameController.clear();

                    fetchAllCategories();
                    Get.back;
                    update();
                  },
                );
              }
            },
            buttonText: "update".tr,
            title: '${"update".tr} ${"folder".tr}'));
  }

  void deleteCategory(BuildContext context, {required int categoryId}) {
    showDeleteConfirmationDialog(context, onConfirm: () async {
      final result = await baseNoteCategoryRepo.deleteCategory(categoryId);
      result.fold(
        (Failure failure) {
          errorSnackBar(message: failure.message);
        },
        (_) {
          getAllNotesController.getAllNotes();
          fetchAllCategories();
          update();
        },
      );

      Get.back();
    });
  }

  @override
  void onInit() {
    super.onInit();
    fetchAllCategories();
  }
}
