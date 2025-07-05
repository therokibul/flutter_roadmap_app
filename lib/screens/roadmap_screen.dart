import 'package:flutter/material.dart';
import '../models/milestone_model.dart'; // Assumes models are in a separate folder
import '../models/resource_model.dart'; // Assumes models are in a separate folder
import '../widgets/milestone_tile.dart'; // Assumes widget is in a separate folder
import 'milestone_details_screen.dart'; // Assumes screen is in a separate folder


// roadmap_screen.dart: The main screen that displays the roadmap timeline.
class RoadmapScreen extends StatefulWidget {
  const RoadmapScreen({super.key});

  @override
  State<RoadmapScreen> createState() => _RoadmapScreenState();
}

class _RoadmapScreenState extends State<RoadmapScreen> {
  // The list of milestones that make up our roadmap.
  // This is where you define the steps for becoming a Flutter developer.
  final List<Milestone> _milestones = [
    Milestone(
      title: '1. Learn Dart Fundamentals',
      description: 'Dart is the programming language used by Flutter. A solid understanding of its concepts is crucial.',
      icon: Icons.code,
      resources: [
        Resource(title: 'Official Dart Documentation', url: 'https://dart.dev/guides'),
        Resource(title: 'DartPad - Online Editor', url: 'https://dartpad.dev'),
      ],
    ),
    Milestone(
      title: '2. Flutter Basics & Widgets',
      description: 'Understand the core concepts of Flutter, including the widget tree, build context, and the difference between Stateless and Stateful widgets.',
      icon: Icons.widgets,
       resources: [
        Resource(title: 'Flutter Documentation', url: 'https://flutter.dev/docs'),
        Resource(title: 'Widget Catalog', url: 'https://flutter.dev/docs/development/ui/widgets'),
      ],
    ),
    Milestone(
      title: '3. State Management',
      description: 'Learn how to manage the state of your application. Start with setState, then explore solutions like Provider, BLoC, or Riverpod.',
      icon: Icons.sync_alt,
       resources: [
        Resource(title: 'State management options', url: 'https://flutter.dev/docs/development/data-and-backend/state-mgmt/options'),
      ],
    ),
    Milestone(
      title: '4. Navigation & Routing',
      description: 'Master how to navigate between different screens in your app using Navigator 2.0 or packages like go_router.',
      icon: Icons.navigation,
       resources: [
        Resource(title: 'Navigation and routing', url: 'https://flutter.dev/docs/development/ui/navigation'),
      ],
    ),
    Milestone(
      title: '5. Working with APIs',
      description: 'Learn how to fetch data from the internet by making HTTP requests to REST APIs.',
      icon: Icons.http,
       resources: [
        Resource(title: 'Networking with Flutter', url: 'https://flutter.dev/docs/cookbook/networking/fetch-data'),
      ],
    ),
    Milestone(
      title: '6. Local Storage',
      description: 'Understand how to persist data on the device using options like shared_preferences for simple data or SQLite/Hive for more complex data.',
      icon: Icons.storage,
       resources: [
        Resource(title: 'Persisting data with shared_preferences', url: 'https://flutter.dev/docs/cookbook/persistence/key-value'),
      ],
    ),
     Milestone(
      title: '7. Firebase Integration',
      description: 'Explore the power of Firebase for backend services like authentication, Firestore database, cloud storage, and more.',
      icon: Icons.local_fire_department,
       resources: [
        Resource(title: 'Add Firebase to your Flutter app', url: 'https://firebase.google.com/docs/flutter/setup'),
      ],
    ),
    Milestone(
      title: '8. Testing & Debugging',
      description: 'Learn to write unit, widget, and integration tests to ensure your app is robust and bug-free. Master Flutter DevTools for debugging.',
      icon: Icons.bug_report,
       resources: [
        Resource(title: 'Testing Flutter apps', url: 'https://flutter.dev/docs/testing'),
        Resource(title: 'Debugging Flutter apps', url: 'https://flutter.dev/docs/testing/debugging'),
      ],
    ),
    Milestone(
      title: '9. Build & Release',
      description: 'Understand the process of preparing your app for the App Store and Google Play, including app signing and creating release builds.',
      icon: Icons.publish,
       resources: [
        Resource(title: 'Build and release for Android', url: 'https://flutter.dev/docs/deployment/android'),
        Resource(title: 'Build and release for iOS', url: 'https://flutter.dev/docs/deployment/ios'),
      ],
    ),
     Milestone(
      title: '10. Keep Learning!',
      description: 'The Flutter ecosystem is always evolving. Stay updated with the latest trends, packages, and best practices.',
      icon: Icons.school,
       resources: [
        Resource(title: 'Flutter YouTube Channel', url: 'https://www.youtube.com/c/flutterdev'),
        Resource(title: 'Flutter Community on Medium', url: 'https://medium.com/flutter-community'),
      ],
    ),
  ];

  /// Toggles the completion status of a milestone.
  void _toggleMilestone(int index) {
    setState(() {
      _milestones[index].isCompleted = !_milestones[index].isCompleted;
    });
  }

  /// Calculates the current progress based on completed milestones.
  double get _progress {
    if (_milestones.isEmpty) return 0.0;
    final completedCount = _milestones.where((m) => m.isCompleted).length;
    return completedCount / _milestones.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Roadmap 2025'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Progress Bar to visualize completion
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                LinearProgressIndicator(
                  value: _progress,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                  minHeight: 10,
                ),
                const SizedBox(height: 8),
                Text(
                  '${(_progress * 100).toStringAsFixed(0)}% Complete',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          // The main list of milestones
          Expanded(
            child: ListView.builder(
              itemCount: _milestones.length,
              itemBuilder: (context, index) {
                return MilestoneTile(
                  milestone: _milestones[index],
                  onTap: () => _toggleMilestone(index),
                  onDetailsTap: () {
                    // Navigate to a details screen when the user wants more info.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MilestoneDetailsScreen(milestone: _milestones[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}