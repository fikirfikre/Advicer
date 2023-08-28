import 'package:advicer/presentation/theme_animation/widget/moon.dart';
import 'package:advicer/presentation/theme_animation/widget/star.dart';
import 'package:advicer/presentation/theme_animation/widget/sun.dart';
import 'package:flutter/material.dart';

class ThemeAnimation extends StatefulWidget {
  const ThemeAnimation({super.key});

  @override
  State<ThemeAnimation> createState() => _ThemeAnimationState();
}

class _ThemeAnimationState extends State<ThemeAnimation> {
  @override
  Widget build(BuildContext context) {
    return Moon();
  }
}