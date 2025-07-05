import 'resource_model.dart'; // Depends on the Resource model
import 'package:flutter/material.dart'; // For IconData

// milestone_model.dart: A data model class to hold the information for each milestone in the roadmap.
class Milestone {
  final String title;
  final String description;
  final IconData icon;
  final List<Resource> resources;
  bool isCompleted;

  Milestone({
    required this.title,
    required this.description,
    required this.icon,
    this.resources = const [],
    this.isCompleted = false,
  });
}