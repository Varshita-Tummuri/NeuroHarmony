import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MeditationsScreen extends StatelessWidget {
  const MeditationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const _BottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // Title
              const Text(
                "Meditations",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search meditations",
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Featured Meditations
              const _FeaturedMeditations(),
              const SizedBox(height: 16),

              // Categories
              const _MeditationCategories(),
              const SizedBox(height: 16),

              // Meditation List
              const _MeditationList(),
            ],
          ),
        ),
      ),
    );
  }
}

// Featured Meditation Section
class _FeaturedMeditations extends StatelessWidget {
  const _FeaturedMeditations();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          _MeditationCard(
            imageUrl: 'https://source.unsplash.com/200x200/?calm,book',
            title: 'Morning Calm',
            subtitle: 'Start your day with peace',
          ),
          SizedBox(width: 12),
          _MeditationCard(
            imageUrl: 'https://source.unsplash.com/200x200/?relax,woman',
            title: 'Evening Relaxation',
            subtitle: 'Unwind before bed',
          ),
        ],
      ),
    );
  }
}

class _MeditationCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const _MeditationCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            // ignore: deprecated_member_use
            colors: [Colors.black.withOpacity(0.4), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Meditation Categories
class _MeditationCategories extends StatelessWidget {
  const _MeditationCategories();

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"icon": LucideIcons.play, "label": "Guided"},
      {"icon": LucideIcons.pause, "label": "Unguided"},
      {"icon": LucideIcons.layoutGrid, "label": "Sleep"},
      {"icon": LucideIcons.layoutGrid, "label": "Focus"},
      {"icon": LucideIcons.layoutGrid, "label": "Breathing"},
    ];

    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return Column(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.pink.shade100,
                child: Icon(categories[index]["icon"] as IconData,
                    color: Colors.pink, size: 24),
              ),
              const SizedBox(height: 4),
              Text(
                categories[index]["label"] as String,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Meditation List
class _MeditationList extends StatelessWidget {
  const _MeditationList();

  @override
  Widget build(BuildContext context) {
    final meditations = [
      {
        "image": "https://source.unsplash.com/200x200/?meditation,silhouette",
        "title": "Deep Breathing",
        "duration": "5 minutes"
      },
      {
        "image": "https://source.unsplash.com/200x200/?zen,walking",
        "title": "Mindful Walking",
        "duration": "10 minutes"
      },
      {
        "image": "https://source.unsplash.com/200x200/?nature,meditation",
        "title": "Body Scan",
        "duration": "15 minutes"
      },
    ];

    return Expanded(
      child: ListView.separated(
        itemCount: meditations.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                meditations[index]["image"]!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              meditations[index]["title"]!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              meditations[index]["duration"]!,
              style: const TextStyle(color: Colors.black54),
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}

// Bottom Navigation Bar
class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.black54,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(LucideIcons.layoutGrid), label: "Meditations"),
        BottomNavigationBarItem(
            icon: Icon(LucideIcons.layoutGrid), label: "Focus"),
        BottomNavigationBarItem(
            icon: Icon(LucideIcons.layoutGrid), label: "Journal"),
      ],
    );
  }
}
