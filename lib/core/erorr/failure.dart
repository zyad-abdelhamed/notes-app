import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

class LacalDBFailure extends Failure {
  const LacalDBFailure({required super.message});
}
