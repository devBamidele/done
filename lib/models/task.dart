class Task {
  int? id;
  String name;
  bool isDone;

  Task({required this.name, this.isDone = false, required this.id});

  // Switch to the opposite when the check box is clicked
  toggleDone() {
    isDone = !isDone;
  }
}
