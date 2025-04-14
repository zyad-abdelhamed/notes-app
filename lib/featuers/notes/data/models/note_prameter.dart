import 'package:equatable/equatable.dart';

class NotePrameter extends Equatable {
  final String? title, descreption, date, quary;
  final bool? isFeatured;

  const NotePrameter(
      {this.title, this.descreption, this.date, this.quary, this.isFeatured});
  @override
  List<Object?> get props => [title, descreption, date, quary, isFeatured];
}
