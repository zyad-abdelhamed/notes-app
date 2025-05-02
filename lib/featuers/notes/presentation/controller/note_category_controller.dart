import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/services/enums/request_state_enum.dart';
import 'package:notes_app/core/erorr/failure.dart';
import 'package:notes_app/featuers/notes/domain/entities/note_category.dart';
import 'package:notes_app/featuers/notes/domain/repos/base_note_category_repo.dart';

class NoteCategoryController extends GetxController {
  NoteCategoryController({required this.baseNoteCategoryRepo});
  final BaseNoteCategoryRepo baseNoteCategoryRepo;

  // =========================
  // Controllers & Variables
  // =========================
  TextEditingController categoryNameController = TextEditingController();
  GlobalKey<FormState> categoryFormKey = GlobalKey<FormState>();

  List<NoteCategory> categories = [];

  RequestStateEnum fetchState = RequestStateEnum.loading;
  RequestStateEnum addState = RequestStateEnum.loading;
  RequestStateEnum updateState = RequestStateEnum.loading;
  RequestStateEnum deleteState = RequestStateEnum.loading;

  String errorMessage = '';

  // =========================
  // CRUD Operations
  // =========================

  Future<void> fetchAllCategories() async {
    fetchState = RequestStateEnum.loading;
    update();
    final result = await baseNoteCategoryRepo.getAllCategories();
    result.fold(
      (Failure failure) {
        errorMessage = failure.message;
        fetchState = RequestStateEnum.failed;
        print(failure.message);
        update();
      },
      (List<NoteCategory> categoryNames) {
        categories = categoryNames;

        fetchState = RequestStateEnum.success;
        print('fetch successfully');
        update();
      },
    );
  }

  Future<void> addCategory(String name) async {
    if (categoryFormKey.currentState!.validate()) {
      addState = RequestStateEnum.loading;
      update();
      final result = await baseNoteCategoryRepo.insertCategory(name);
      result.fold(
        (Failure failure) {
          errorMessage = failure.message;
          addState = RequestStateEnum.failed;
        },
        (_) async {
          categoryNameController.clear();
          addState = RequestStateEnum.success;
          await fetchAllCategories();
          Get.back();
        },
      );
      update();
    }
  }

  Future<void> updateCategory(int index, String newName) async {
    if (categoryFormKey.currentState!.validate()) {
      updateState = RequestStateEnum.loading;
      update();
      final result = await baseNoteCategoryRepo.updateCategory(
          categories[index].id, newName);
      result.fold(
        (Failure failure) {
          errorMessage = failure.message;
          updateState = RequestStateEnum.failed;
        },
        (_)async {
          updateState = RequestStateEnum.success;
          await fetchAllCategories();
          Get.back();
        },
      );
      update();
    }
  }

  Future<void> deleteCategory(int index) async {
    deleteState = RequestStateEnum.loading;
    update();
    final result =
        await baseNoteCategoryRepo.deleteCategory(categories[index].id);
    result.fold(
      (Failure failure) {
        errorMessage = failure.message;
        deleteState = RequestStateEnum.failed;
      },
      (_) {
        categories.removeAt(index);
        deleteState = RequestStateEnum.success;
      },
    );
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchAllCategories();
  }
}
