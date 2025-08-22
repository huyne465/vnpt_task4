import 'package:flutter/material.dart';
import 'package:vnpt_task4/constants/app_constants.dart';

class RequiredLabel extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextStyle? requiredStyle;

  const RequiredLabel({
    super.key,
    required this.text,
    this.textStyle,
    this.requiredStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            style:
                textStyle ??
                const TextStyle(
                  fontSize: 24,
                  color: Colors.black87,
                  fontWeight: FontWeight.w800,
                ),
            children: [
              TextSpan(text: text),
              TextSpan(
                text: ' ${AppConstants.mustEnter}',
                style:
                    requiredStyle ??
                    const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
