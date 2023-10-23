import 'package:flutter/material.dart';

/// Category model represents a single category of meals.
/// Example: Italian, Quick & Easy, etc.
class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange, // Orange is default
  });
}
