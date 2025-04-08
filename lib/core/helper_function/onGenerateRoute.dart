import 'package:flutter/material.dart';
import 'package:notes_app/core/constants/routes_constants.dart';
import 'package:notes_app/featuers/notes/presentation/view/pages/home_page.dart';


Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesConstants.homePageRouteName:
      return MaterialPageRoute<HomePage>(
        builder: (BuildContext context) => const HomePage(),
      ); 
    default:
      return MaterialPageRoute<Scaffold>(
        builder: (BuildContext context) => const Scaffold(),
      );
  }
}
