import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(LucideIcons.search), label: "Meditations"),
          BottomNavigationBarItem(
              icon: Icon(LucideIcons.layoutGrid), label: "Focus"),
          BottomNavigationBarItem(
              icon: Icon(LucideIcons.bookOpen), label: "Journal"),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text("Journal",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),

              // 🔍 Search Bar
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(LucideIcons.search, color: Colors.grey),
                  hintText: "Search entries",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // 📅 Scrollable Categories
              SizedBox(
                height: 75,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    categoryButton("Daily", LucideIcons.calendar),
                    categoryButton("Weekly", LucideIcons.calendar),
                    categoryButton("Monthly", LucideIcons.calendar),
                    categoryButton("Gratitude", LucideIcons.bookmark),
                    categoryButton("Dreams", LucideIcons.star),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // 📖 Recent Entries
              Text("Recent Entries",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              journalEntry("assets/meditation-girl-nature-vector-22317576.jpg",
                  "Morning Reflection", "Today I felt..."),
              journalEntry("assets/pexels-pixabay-235990.jpg", "Weekly Summary",
                  "This week was..."),
              journalEntry(
                  "assets/task3.png", "Gratitude Log", "I am grateful for..."),

              SizedBox(height: 20),

              // 😊 Mood Entries
              Text("Mood Entries",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    moodButton("Happy", LucideIcons.smile, Colors.pink),
                    moodButton("Anxious", LucideIcons.frown, Colors.green),
                    moodButton("Angry", LucideIcons.thumbsDown, Colors.red),
                    moodButton("Sad", LucideIcons.frown,
                        const Color.fromARGB(255, 56, 55, 55)),
                    moodButton("Calm", LucideIcons.thumbsUp, Colors.blue),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔘 Category Button Widget
  Widget categoryButton(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.pink[100],
            radius: 25,
            child: Icon(icon, color: Colors.pink),
          ),
          SizedBox(height: 5),
          Text(text,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  // 📝 Journal Entry Widget
  Widget journalEntry(String imagePath, String title, String subtitle) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
      ),
      title: Text(title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle:
          Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  // 😃 Mood Button Widget
  Widget moodButton(String text, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 249, 202, 217),
            radius: 25,
            child: Icon(icon, color: color),
          ),
          SizedBox(height: 5),
          Text(text,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
