import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestingPart extends StatefulWidget {
  const TestingPart({super.key});

  @override
  _TestingPartState createState() => _TestingPartState();
}

class _TestingPartState extends State<TestingPart> {
  List<String> notDoneTasks = ["Task 1", "Task 2", "Task 3"];
  List<String> ongoingTasks = [];
  List<String> completedTasks = [];

  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 255, 255, 255), // Soft pastel background
      appBar: AppBar(
        title: Text("Task Manager",
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.pink[300], // Cute pink theme
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildTaskInputField(), // Add Task moved to top
          _buildTaskSection("📌 Not Done", notDoneTasks, null, moveToOngoing,
              const Color.fromARGB(255, 250, 175, 183)),
          _buildTaskSection("⏳ Ongoing", ongoingTasks, moveToNotDone,
              moveToCompleted, Colors.orange[100]),
          _buildTaskSection("✅ Completed", completedTasks,
              moveToOngoingFromCompleted, null, Colors.green[100]),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(), // Space for floating button
        notchMargin: 8.0, // Space between button and bar
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0), // Adjust spacing
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Even spacing
            children: [
              _buildNavItem(Icons.home, "Home"),
              _buildNavItem(Icons.self_improvement, "Meditate"),
              SizedBox(width: 48), // Space for floating button
              _buildNavItem(Icons.timer, "Focus"),
              _buildNavItem(Icons.menu_book, "Journal"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: AI voice assistant action
        },
        backgroundColor: Colors.pink,
        child: Icon(Icons.mic, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildTaskSection(String title, List<String> tasks,
      Function(String)? moveBack, Function(String)? moveForward, Color? color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(title,
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView(
                children: tasks
                    .map((task) =>
                        _buildTaskItem(task, moveBack, moveForward, color))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskItem(String task, Function(String)? moveBack,
      Function(String)? moveForward, Color? color) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      color: color, // Section-specific colors
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3, // Soft shadow for depth
      child: ListTile(
        title: Text(task, style: GoogleFonts.poppins(fontSize: 16)),
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
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => deleteTask(task),
            ),
          ],
        ),
      ),
    );
  }

  void addTask() {
    String newTask = taskController.text.trim();
    if (newTask.isNotEmpty) {
      setState(() {
        notDoneTasks.add(newTask);
        taskController.clear();
      });
    }
  }

  void moveToOngoing(String task) {
    setState(() {
      notDoneTasks.remove(task);
      ongoingTasks.add(task);
    });
  }

  void moveToCompleted(String task) {
    setState(() {
      ongoingTasks.remove(task);
      completedTasks.add(task);
    });
  }

  void moveToNotDone(String task) {
    setState(() {
      ongoingTasks.remove(task);
      notDoneTasks.add(task);
    });
  }

  void moveToOngoingFromCompleted(String task) {
    setState(() {
      completedTasks.remove(task);
      ongoingTasks.add(task);
    });
  }

  void deleteTask(String task) {
    setState(() {
      notDoneTasks.remove(task);
      ongoingTasks.remove(task);
      completedTasks.remove(task);
    });
  }

  Widget _buildTaskInputField() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: taskController,
              decoration: InputDecoration(
                hintText: "Enter new task",
                hintStyle: GoogleFonts.poppins(),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black, // Add border color here
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: addTask,
            style: IconButton.styleFrom(
              backgroundColor: Colors.pink[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildNavItem(IconData icon, String label) {
  return TextButton(
    onPressed: () {}, // TODO: Add navigation
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.pink),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.pink)),
      ],
    ),
  );
}
