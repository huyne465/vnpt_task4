import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vnpt_task5/constants/app_constants.dart';
import 'package:vnpt_task5/generated/locale_keys.g.dart';

class Step4Content extends StatelessWidget {
  const Step4Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 170.h),
      child: Column(
        children: [
          Icon(Icons.check_circle_outline, size: 50.sp, color: Colors.green),
          SizedBox(height: 8.h),
          Text(
            LocaleKeys.success_title.tr(),
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Text(LocaleKeys.success_subTitle.tr(), style: successSubtittle),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}
