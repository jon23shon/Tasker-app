class Task {
  String? id;
  String? textOnTask;
  bool complete;

  Task({required this.id, required this.textOnTask, this.complete = false});

  static List<Task> taskList() {
    return <Task>[
      Task(id: 'task1', textOnTask: 'Task 1', complete: true),
      Task(id: 'task2', textOnTask: 'Task 2', complete: true),
      Task(
        id: 'task3',
        textOnTask: 'Task 3',
      ),
    ];
  }
}
