import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    this.id,
    this.title,
    this.color = Colors.amber,
  });
}
