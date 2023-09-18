import 'package:flutter/material.dart';

class Category {
  const Category(
      {this.color = Colors.orangeAccent,
      required this.id,
      required this.title});

  final String id;
  final String title;
  final Color color;
}
