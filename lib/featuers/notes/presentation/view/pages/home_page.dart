
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/constants/routes_constants.dart';
import 'package:notes_app/core/helper_function/get_widget_depending_on_reuest_state.dart';
import 'package:notes_app/featuers/notes/presentation/controller/get_all_notes.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/home_app_bar_actions.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/home_note_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const double _spacing = 15.0;
  static const int _crossAxisCount = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hometitel".tr),
        bottom: PreferredSize(
            preferredSize: Size(double.infinity, 30), child: SizedBox()),
        actions: appBarActions(context),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<GetAllNotesController>(
            builder: (controller) {
              return getWidgetDependingOnReuestState(
                  requestStateEnum: controller.allNotesState,
                  widgetIncaseSuccess: SingleChildScrollView(
                    child: StaggeredGrid.count(
                      
                      crossAxisCount: _crossAxisCount,
                      mainAxisSpacing: _spacing,
                      crossAxisSpacing: _spacing,
                      children: List.generate(
                        controller.notes.length,
                        (index) => HomeNoteWidget(
                          note: controller.notes[index],
                        ),
                      ),
                    ),
                  ),
                  erorrMessage: controller.allNotesError);
            },
          )),
      floatingActionButton: Column(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
              onTap: () {
                Get.toNamed(RoutesConstants.foldersPageRouteName);
              },
              child: const Icon(Icons.folder_copy, size: 40)),
          FloatingActionButton(
            onPressed: () => Get.toNamed(RoutesConstants.addNotePageRouteName),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
