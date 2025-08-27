import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vnpt_task5/core/ui/general_widget/stf_widget/image_picker.dart';
import 'package:vnpt_task5/core/ui/general_widget/stl_widget/guide_authorize.dart';
import 'package:vnpt_task5/generated/locale_keys.g.dart';

class Step3Content extends StatelessWidget {
  const Step3Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          LocaleKeys.authorizeStep_step3.tr(),
          style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.h),
        CustomImagePicker(
          title: LocaleKeys.title_portrait.tr(),
          subtitle: LocaleKeys.title_portraitSubtitle.tr(),
          onTap: () {
            // Handle image picker tap for selfie
          },
          selectedImage: null,
          hasImage: false,
        ),
        SizedBox(height: 16.h),
        GuideAuthorize(),
        SizedBox(height: 15.h),
      ],
    );
  }
}
