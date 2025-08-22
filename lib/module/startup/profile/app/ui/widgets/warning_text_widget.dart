import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vnpt_task4/constants/app_constants.dart';

class WarningTextWidget extends StatelessWidget {
  final TextStyle? textStyle;
  final TextStyle? requiredStyle;

  const WarningTextWidget({super.key, this.textStyle, this.requiredStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            style:
                textStyle ??
                TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w400,
                ),
            children: [
              TextSpan(text: 'Lưu Ý: Dấu '),
              TextSpan(
                text: AppConstants.mustEnter,
                style:
                    requiredStyle ??
                    const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              TextSpan(text: ' là trường hợp bắt buộc phải nhập'),
            ],
          ),
        ),
      ],
    );
  }
}
