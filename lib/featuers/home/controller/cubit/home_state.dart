part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class Switchchange extends HomeState {}

final class Deletn extends HomeState {}

final class Searchn extends HomeState {}

final class Loading extends HomeState {}

final class Changefavoritestarcolorstate extends HomeState {}

final class Converttolighttheme extends HomeState {}

final class Converttodarktheme extends HomeState {}
