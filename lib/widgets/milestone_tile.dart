import 'package:flutter/material.dart';
import '../models/milestone_model.dart'; // Assumes models are in a separate folder

// milestone_tile.dart: A custom widget for displaying each milestone in the list.
class MilestoneTile extends StatelessWidget {
  final Milestone milestone;
  final VoidCallback onTap; // Callback for when the checkbox is tapped
  final VoidCallback onDetailsTap; // Callback for when the tile itself is tapped

  const MilestoneTile({
    super.key,
    required this.milestone,
    required this.onTap,
    required this.onDetailsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        // InkWell provides the ripple effect on tap
        child: InkWell(
          onTap: onDetailsTap, // Navigate to details screen on tap
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Checkbox to mark the milestone as complete
                Checkbox(
                  value: milestone.isCompleted,
                  onChanged: (bool? value) {
                    onTap(); // Trigger the completion toggle
                  },
                  activeColor: Colors.green,
                ),
                const SizedBox(width: 16),
                // Icon representing the milestone category
                Icon(
                  milestone.icon,
                  color: milestone.isCompleted ? Colors.green : Colors.blueAccent,
                  size: 30
                ),
                const SizedBox(width: 16),
                // Title of the milestone
                Expanded(
                  child: Text(
                    milestone.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      // Apply a strikethrough style if the milestone is completed
                      decoration: milestone.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                    ),
                  ),
                ),
                // Arrow icon to indicate that the tile is tappable for more details
                const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
