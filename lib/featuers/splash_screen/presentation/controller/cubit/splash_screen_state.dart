part of 'splash_screen_cubit.dart';

class SplashScreenState extends Equatable {
  const SplashScreenState({this.offset  = const Offset(0,3)});
  final Offset offset;
  

  @override
  List<Object> get props => [offset];
}

