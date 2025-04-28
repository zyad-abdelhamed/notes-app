import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:notes_app/core/constants/routes_constants.dart';
import 'package:notes_app/core/constants/view_constants.dart';
import 'package:notes_app/featuers/notes/presentation/view/pages/add_note_page.dart';
import 'package:notes_app/featuers/notes/presentation/view/pages/featured_notes_page.dart';
import 'package:notes_app/featuers/notes/presentation/view/pages/folders_page.dart';
import 'package:notes_app/featuers/notes/presentation/view/pages/home_page.dart';
import 'package:notes_app/featuers/notes/presentation/view/pages/search_page.dart';
import 'package:notes_app/featuers/splash_screen/presentation/view/pages/splash_screen_page.dart';

List<GetPage<dynamic>>? get getPages => <GetPage<dynamic>>[
      GetPage(
          name: RoutesConstants.searchScreenPageRouteName,
          page: () => const SearchPage(),
          transitionDuration: ViewConstants.longDuration),
      GetPage(
        name: RoutesConstants.splashScreenPageRouteName,
        page: () => const SplashScreenPage(),
      ),
      GetPage(
          name: RoutesConstants.homePageRouteName,
          page: () => const HomePage(),
          transitionDuration: ViewConstants.longDuration),
      GetPage(
          name: RoutesConstants.addNotePageRouteName,
          page: () => const AddNotePage(),
          transitionDuration: ViewConstants.longDuration),
      GetPage(
          name: RoutesConstants.foldersPageRouteName,
          page: () => const FoldersPage(),
          transitionDuration: ViewConstants.longDuration),
      GetPage(
          name: RoutesConstants.featuredNotesPageRouteName,
          page: () => const FeaturedNotesPage(),
          transitionDuration: ViewConstants.longDuration),
    ];
