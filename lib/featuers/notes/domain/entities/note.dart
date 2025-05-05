import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final dynamic id, categoryId;
  final String title, descreption, createdAt;
  final String? lastUpdate;
  final bool isFeatured;
  const Note(
      {required this.categoryId,
      required this.id,
      required this.title,
      required this.descreption,
      required this.createdAt,
      required this.lastUpdate,
      required this.isFeatured});
  @override
  List<Object?> get props =>
      [title, descreption, createdAt, lastUpdate, isFeatured, id, categoryId];
}
