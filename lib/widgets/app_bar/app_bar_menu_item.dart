import 'package:flutter/material.dart';

class AppBarMenuItem {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  AppBarMenuItem({required this.icon, required this.text, required this.onTap});
}
