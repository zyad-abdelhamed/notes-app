import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_app/core/extentions/controllers_extention.dart';
import 'package:notes_app/core/extentions/localization_extention.dart';
import 'package:notes_app/core/theme/theme_provider.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/note_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final double spacing = 15.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my notes'
            ),
        actions: _appBarActions(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(
            5,
            (index) =>
                NoteWidget(title: 'hello world', descreption: _desc[index]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  List<Widget> _appBarActions(BuildContext context) {
    final IconData themeIcon =
        context.themeController.darkMode ? Icons.light_mode : Icons.dark_mode;

    return [
      IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      IconButton(
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false).changeTheme();
          },
          icon: Icon(themeIcon)),
      IconButton(onPressed: () {}, icon: Icon(Icons.language))
    ];
  }
}

List _desc = [
  'hello worldhello worldhello world',
  'hello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello world',
  'hello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello world',
  'hello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello world',
  'hello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello world'
];
