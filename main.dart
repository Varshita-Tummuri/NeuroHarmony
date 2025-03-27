import 'package:flutter/material.dart';
import 'package:neuro_harmony/meditations.dart';
//import 'package:neuro_harmony/task_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: const MeditationsScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: Colors.purple,
        child: Icon(Icons.mic, color: Colors.white),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, // Centered at the bottom

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFeatureIcon(Icons.self_improvement, "Meditations"),
                      _buildFeatureIcon(Icons.timer, "Focus Timers"),
                      _buildFeatureIcon(Icons.menu_book, "Journal Prompts"),
                      _buildFeatureIcon(Icons.smart_toy, "AI Assistant"),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text("Your Tasks",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SwitchListTile(
                  title: Text("Receive notifications"),
                  value: false,
                  onChanged: (value) {},
                ),
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("Add Task"),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => TaskManager()),
                    // );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text("Remove Task"),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => TaskManager()),
                    // );
                  },
                ),
                SizedBox(height: 20),
                SizedBox(height: 20),
                Text("Meditation Guides",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        child: _buildMeditationCard(
                            "Meditation Guide 1",
                            "Calm your mind",
                            'assets/pexels-pixabay-235990.jpg')),
                    SizedBox(width: 10),
                    Expanded(
                        child: _buildMeditationCard(
                            "Meditation Guide 2",
                            "Focus and relax",
                            'assets/meditation-girl-nature-vector-22317576.jpg')),
                  ],
                ),
                SizedBox(height: 20),
                Text("Points & Themes",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildPointsButton(Icons.star, "Earn Points"),
                    _buildPointsButton(Icons.monetization_on, "Buy Themes"),
                    _buildPointsButton(Icons.loyalty, "Redeem Rewards"),
                  ],
                ),
                SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10), // Adds horizontal spacing
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.purple.shade100,
            child: Icon(icon, color: Colors.purple),
          ),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildMeditationCard(String title, String subtitle, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      height: 120,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(title,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text(subtitle, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildPointsButton(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.purple.shade100,
            child: Icon(icon, color: Colors.purple),
          ),
          SizedBox(height: 5),
          Text(text, style: TextStyle(fontSize: 12)),
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
        Icon(icon, color: Colors.purple),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.purple)),
      ],
    ),
  );
}
