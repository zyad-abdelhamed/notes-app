import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/text_styles.dart';

class ErorrWidget extends StatelessWidget {
  final String message;
  const ErorrWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      shape:
          ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Text(
        message,
        style: TextStyles.semiBold16(
          context: context,
        ).copyWith(color: Colors.red),
      ),
    ));
  }
}
