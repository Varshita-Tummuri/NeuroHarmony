import 'package:flutter/material.dart';

class MeditationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Meditations",
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search meditations",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    meditationCard("assets/task6.jpeg", "Morning Calm",
                        "Start your day with peace"),
                    SizedBox(width: 10),
                    meditationCard("assets/task3.png", "Evening Relaxation",
                        "Unwind before bed"),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categoryButtons(),
                ),
              ),
              SizedBox(height: 10),
              meditationListItem(
                  "assets/meditation-girl-nature-vector-22317576.jpg",
                  "Deep Breathing",
                  "5 minutes"),
              meditationListItem("assets/pexels-pixabay-235990.jpg",
                  "Mindful Walking", "10 minutes"),
              meditationListItem(
                  "assets/task1.jpeg", "Body Scan", "15 minutes"),
            ],
          ),
        ),
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
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, // Centered at the bottom
    );
  }

  Widget meditationCard(String imagePath, String title, String subtitle) {
    return Container(
      width: 160,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withOpacity(0.7), Colors.transparent],
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Text(subtitle,
                  style: TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> categoryButtons() {
    List<String> categories = [
      "Guided",
      "Unguided",
      "Sleep",
      "Focus",
      "Breathing"
    ];
    return categories.map((category) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Chip(
          label: Text(category, style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.pink,
        ),
      );
    }).toList();
  }

  Widget meditationListItem(String imagePath, String title, String duration) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(duration, style: TextStyle(color: Colors.grey.shade600)),
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
