import 'package:flutter/material.dart';
import 'package:vnpt_task4/constants/app_icons.dart';
import 'package:vnpt_task4/constants/app_textStyle.dart';

class RuleWidget extends StatelessWidget {
  final String rule;
  const RuleWidget({super.key, required this.rule});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppIcons.invalidIcon,
        SizedBox(width: 8),
        Text(rule, style: textStyleSmall),
      ],
    );
  }
}
