import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vnpt_task4/constants/app_textStyle.dart';

class TabProfileWidget extends StatelessWidget {
  const TabProfileWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.icon,
    required this.color,
    this.textStyle,
    this.trailingIcon,
    this.showTrailingIcon = false,
  });
  final VoidCallback onTap;
  final String title;
  final IconData? icon;
  final Color color;
  final TextStyle? textStyle;
  final IconData? trailingIcon;
  final bool showTrailingIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 22.sp, color: color),
              SizedBox(width: 10.w),
              Text(
                title,
                style:
                    textStyle ?? textStyleSmall.copyWith(color: Colors.black),
              ),
            ],
          ),
          if (showTrailingIcon)
            Icon(
              trailingIcon ?? Icons.arrow_forward_ios,
              size: 16.sp,
              color: Colors.grey[600],
            ),
        ],
      ),
    );
  }
}
