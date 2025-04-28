import 'package:flutter/material.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/search_text_field.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchTextField(),
    );
  }
}
