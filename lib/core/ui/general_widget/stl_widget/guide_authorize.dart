import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vnpt_task5/constants/app_constants.dart';

import 'package:vnpt_task5/generated/locale_keys.g.dart';

class GuideAuthorize extends StatelessWidget {
  const GuideAuthorize({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.all(10.sp),
        width: double.infinity,
        height: 120.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.remove_red_eye, color: Colors.blue),
                SizedBox(width: 8.w),
                Text(LocaleKeys.guide_title.tr(), style: textStyleMedium),
              ],
            ),
            SizedBox(height: 8.h),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.blue[50],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.guide_step1.tr(),
                            style: warningRuleTextStyleSmall,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            LocaleKeys.guide_step2.tr(),
                            style: warningRuleTextStyleSmall,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            LocaleKeys.guide_step3.tr(),
                            style: warningRuleTextStyleSmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
