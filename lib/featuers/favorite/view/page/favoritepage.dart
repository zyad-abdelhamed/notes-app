import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memos/featuers/favorite/view/components/favoritebody.dart';

class Favoritepage extends StatelessWidget {
  const Favoritepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('the favorite'),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(CupertinoIcons.back)),
      ),
      body: const Favoritebody(),
    );
  }
}