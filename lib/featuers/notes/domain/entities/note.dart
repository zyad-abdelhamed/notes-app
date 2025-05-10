class Note {
  final dynamic id, categoryId;
  final String title, descreption, createdAt;
  final String? lastUpdate;
  final bool isFavorite;
  const Note(
      {required this.categoryId,
      required this.id,
      required this.title,
      required this.descreption,
      required this.createdAt,
      required this.lastUpdate,
      required this.isFavorite});
}
