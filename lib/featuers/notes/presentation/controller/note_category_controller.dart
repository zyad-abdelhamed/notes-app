import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/featuers/notes/domain/repos/base_note_category_repo.dart';

class NoteCategoryController extends GetxController {
  NoteCategoryController({required this.baseNoteCategoryRepo});
  final BaseNoteCategoryRepo baseNoteCategoryRepo;

  // =========================
  // Controllers & Variables
  // =========================
  TextEditingController categoryNameController = TextEditingController();
  GlobalKey<FormState> categoryFormKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> categories = [];
  bool isLoading = false;
  String errorMessage = '';

  // =========================
  // CRUD Operations
  // =========================

  Future<void> fetchAllCategories() async {
    try {
      isLoading = true;
      update();
      final result = await baseNoteCategoryRepo.getAllCategories();
      categories = result;
    } catch (e) {
      errorMessage = 'حدث خطأ أثناء جلب التصنيفات: $e';
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> addCategory(String name) async {
    try {
      isLoading = true;
      update();
      final id = await baseNoteCategoryRepo.insertCategory(name);
      categories.add({'id': id, 'name': name});
      categoryNameController.clear();
    } catch (e) {
      errorMessage = 'تعذر إضافة التصنيف: $e';
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> updateCategory(int id, String newName) async {
    try {
      isLoading = true;
      update();
      await baseNoteCategoryRepo.updateCategory(id, newName);
      final index = categories.indexWhere((c) => c['id'] == id);
      if (index != -1) {
        categories[index]['name'] = newName;
      }
    } catch (e) {
      errorMessage = 'فشل التحديث: $e';
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> deleteCategory(int id) async {
    try {
      isLoading = true;
      update();
      await baseNoteCategoryRepo.deleteCategory(id);
      categories.removeWhere((c) => c['id'] == id);
    } catch (e) {
      errorMessage = 'فشل الحذف: $e';
    } finally {
      isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchAllCategories();
  }
}
