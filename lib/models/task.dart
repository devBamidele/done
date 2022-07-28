class Task {
  String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  // Switch to the opposite when the check box is clicked
  toggleDone() {
    isDone = !isDone;
  }
}
