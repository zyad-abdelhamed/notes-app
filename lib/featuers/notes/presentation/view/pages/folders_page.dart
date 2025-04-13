import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/add_folder_button.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/folder_widget.dart';

class FoldersPage extends StatelessWidget {
  const FoldersPage({super.key});
  final double spacing = 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AllFolders".tr),
        bottom: PreferredSize(preferredSize: Size(double.infinity, 30), child:SizedBox() ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.builder(
          itemCount: 5,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing),
          itemBuilder: (context, index) => FolderWidget(),
        ),
      ),

      floatingActionButton: AddFolderButton(),
    );
  }
}