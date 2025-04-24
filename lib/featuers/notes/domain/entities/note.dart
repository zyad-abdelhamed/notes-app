import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String title, descreption, date;
  final bool isFeatured;
  const Note(
      {required this.title,
      required this.descreption,
      required this.date,
      required this.isFeatured});
  @override
  List<Object?> get props => [title, descreption, date, isFeatured];
}
