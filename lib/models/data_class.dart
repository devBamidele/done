class DataClass {
  String task;
  int complete;
  String category;

  DataClass({
    required this.task,
    required this.complete,
    required this.category,
  });

  // Convert a [the DataClass] into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'task': task,
      'complete': complete,
      'category': category,
    };
  }

  // Implement toString to make it easier to see information about
  // each item when using the print statement.
  @override
  String toString() {
    return 'Task{task: $task, complete: $complete, category $category}';
  }
}
