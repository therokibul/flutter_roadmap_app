import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the package

import '../models/milestone_model.dart';

// milestone_details_screen.dart: Shows details and resources for a milestone.
class MilestoneDetailsScreen extends StatelessWidget {
  final Milestone milestone;

  const MilestoneDetailsScreen({super.key, required this.milestone});

  // Function to launch a URL.
  // It checks if the URL can be launched before attempting to open it.
  Future<void> _launchURL(String urlString, BuildContext context) async {
    // Sanitize the URL string to remove whitespace and quotes for robustness.
    final sanitizedUrlString = urlString.trim().replaceAll('"', '');

    try {
      final Uri url = Uri.parse(sanitizedUrlString);

      // Note: For iOS, you must add LSApplicationQueriesSchemes to Info.plist
      // or launchUrl will fail.
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        // Show an error message if the URL can't be launched by the OS.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $sanitizedUrlString')),
        );
      }
    } catch (e) {
      // This catch block is for when Uri.parse() fails.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Debug Error: Invalid URL format for >$sanitizedUrlString<',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(milestone.title)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with icon and title
            Row(
              children: [
                Icon(
                  milestone.icon,
                  size: 40,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    milestone.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Description of the milestone
            Text(
              milestone.description,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 32),
            // Section for learning resources
            const Text(
              'Learning Resources',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 1),
            const SizedBox(height: 8),
            // List of resource links
            if (milestone.resources.isEmpty)
              const Text('No resources available for this milestone yet.')
            else
              // Use Expanded to make the list scrollable if it overflows
              Expanded(
                child: ListView(
                  children: milestone.resources.map((resource) {
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.link),
                        title: Text(resource.title),
                        onTap: () {
                          // Call the _launchURL function when a resource is tapped.
                          _launchURL(resource.url, context);
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
