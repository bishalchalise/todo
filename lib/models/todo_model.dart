class Todo {
  final String id;
  final String title;
  final String description;
  final String category;
  final DateTime dateTime;
  final bool isCompleted;
  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.dateTime,
    required this.isCompleted,
  });
}
