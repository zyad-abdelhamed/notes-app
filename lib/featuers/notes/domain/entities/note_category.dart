import 'package:equatable/equatable.dart';

class NoteCategory extends Equatable{
  final int id;
  final String categoryName;

 const NoteCategory({
    required this.id,
    required this.categoryName,
  });
  
  @override
  List<Object?> get props => [id,categoryName];
}
