import 'package:flutter/material.dart';
import 'package:notes_app/core/utils/enums/request_state_enum.dart';
import 'package:notes_app/core/widgets/erorr_widget.dart';


Widget getWidgetDependingOnReuestState(
    {required RequestStateEnum requestStateEnum,
    required Widget widgetIncaseSuccess,
    required String? erorrMessage}) {
  switch (requestStateEnum) {
    case RequestStateEnum.success:
      return widgetIncaseSuccess;
    case RequestStateEnum.failed:
      return ErorrWidget(message: erorrMessage!);
    case RequestStateEnum.loading:
      return Center(child: CircularProgressIndicator());
  }
}
