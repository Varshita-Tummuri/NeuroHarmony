import 'package:flutter/material.dart';

class TaskManager extends StatefulWidget {
  const TaskManager({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TaskManagerState createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  List<String> notDoneTasks = ["Task 1", "Task 2", "Task 3"];
  List<String> ongoingTasks = [];
  List<String> completedTasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task Manager")),
      body: Column(
        children: [
          _buildTaskSection(
              "Not Done", notDoneTasks, moveToOngoing, moveToCompleted),
          _buildTaskSection(
              "Ongoing", ongoingTasks, moveToNotDone, moveToCompleted),
          _buildTaskSection(
              "Completed", completedTasks, moveToOngoing, moveToNotDone),
        ],
      ),
    );
  }

  /// Builds a section (Not Done, Ongoing, Completed)
  Widget _buildTaskSection(String title, List<String> tasks,
      Function(String)? moveBack, Function(String)? moveForward) {
    return Expanded(
      child: Column(
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView(
              children: tasks
                  .map((task) => _buildTaskItem(task, moveBack, moveForward))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a task item with buttons to move between categories
  Widget _buildTaskItem(
      String task, Function(String)? moveBack, Function(String)? moveForward) {
    return ListTile(
      title: Text(task),
      tileColor: Colors.grey[200],
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (moveBack != null)
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.orange),
              onPressed: () => moveBack(task),
            ),
          if (moveForward != null)
            IconButton(
              icon: const Icon(Icons.arrow_forward, color: Colors.green),
              onPressed: () => moveForward(task),
            ),
        ],
      ),
    );
  }

  /// Moves task from Not Done → Ongoing
  void moveToOngoing(String task) {
    setState(() {
      notDoneTasks.remove(task);
      ongoingTasks.add(task);
    });
  }

  /// Moves task from Ongoing → Completed
  void moveToCompleted(String task) {
    setState(() {
      ongoingTasks.remove(task);
      completedTasks.add(task);
    });
  }

  /// Moves task from Ongoing → Not Done
  void moveToNotDone(String task) {
    setState(() {
      ongoingTasks.remove(task);
      notDoneTasks.add(task);
    });
  }

  /// Moves task from Completed → Ongoing
  void moveToOngoingFromCompleted(String task) {
    setState(() {
      completedTasks.remove(task);
      ongoingTasks.add(task);
    });
  }

  /// Moves task from Completed → Not Done
  void moveToNotDoneFromCompleted(String task) {
    setState(() {
      completedTasks.remove(task);
      notDoneTasks.add(task);
    });
  }
}
