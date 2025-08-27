// Data class cho step
import 'package:flutter/material.dart';

class StepData {
  final String title;
  final Widget Function() screenBuilder;
  final bool isRequired;
  final IconData? icon;

  StepData({
    required this.title,
    required this.screenBuilder,
    this.isRequired = true,
    this.icon,
  });
}
