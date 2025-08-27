import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vnpt_task5/constants/app_constants.dart';
import 'package:vnpt_task5/constants/app_icon.dart';
import 'package:vnpt_task5/generated/locale_keys.g.dart';

class WarningAuthorize extends StatelessWidget {
  const WarningAuthorize({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.amber[50],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(AppIcon.invalidIcon.icon, color: Colors.amber),
                SizedBox(width: 8.w),
                Text(LocaleKeys.warning_title.tr(), style: textStyleMedium),
              ],
            ),
            SizedBox(height: 8.h),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.warning_rule1.tr(),
                    style: warningRuleTextStyleSmall,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    LocaleKeys.warning_rule2.tr(),
                    style: warningRuleTextStyleSmall,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    LocaleKeys.warning_rule3.tr(),
                    style: warningRuleTextStyleSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
