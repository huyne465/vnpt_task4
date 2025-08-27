import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vnpt_task5/core/ui/general_widget/stf_widget/image_picker.dart';
import 'package:vnpt_task5/core/ui/general_widget/stl_widget/warning_authorize.dart';
import 'package:vnpt_task5/generated/locale_keys.g.dart';

class Step2Content extends StatelessWidget {
  const Step2Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          LocaleKeys.authorizeStep_step2.tr(),
          style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.h),
        CustomImagePicker(
          title: LocaleKeys.title_authorizeBackTitle.tr(),
          subtitle: LocaleKeys.title_authorizeSubtitle.tr(),
          onTap: () {
            // Handle image picker tap for back of citizen ID
          },
          selectedImage: null,
          hasImage: true,
        ),
        SizedBox(height: 16.h),
        WarningAuthorize(),
        SizedBox(height: 20.h),
      ],
    );
  }
}
