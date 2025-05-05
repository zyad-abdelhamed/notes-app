import 'package:equatable/equatable.dart';

class NotePrameter extends Equatable {
  final String? title, descreption;
  final dynamic id,categoryId;
  final bool? isFeatured;

  const NotePrameter(
      {this.id, this.title, this.descreption, this.categoryId, this.isFeatured});
  @override
  List<Object?> get props => [title, descreption, isFeatured, id,categoryId];
}
