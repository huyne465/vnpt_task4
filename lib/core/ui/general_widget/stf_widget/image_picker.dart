import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:vnpt_task5/generated/locale_keys.g.dart';

class CustomImagePicker extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Widget? selectedImage;
  final bool hasImage;

  const CustomImagePicker({
    super.key,
    this.title,
    this.subtitle,
    this.onTap,
    this.selectedImage,
    this.hasImage = false,
  });

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            // Header với title và subtitle
            if (widget.title != null || widget.subtitle != null)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.title != null)
                      Row(
                        children: [
                          Icon(
                            Icons.credit_card,
                            size: 20.r,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            widget.title!,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    if (widget.subtitle != null) ...[
                      SizedBox(height: 4.h),
                      Text(
                        widget.subtitle!,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

            // Image picker area
            GestureDetector(
              onTap: widget.onTap,
              child: Container(
                width: double.infinity,
                height: 150.h,
                margin: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                child: widget.hasImage && widget.selectedImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: widget.selectedImage!,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60.r,
                            height: 60.r,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 30.r,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            LocaleKeys.upload_attachment.tr(),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            LocaleKeys.upload_chooseFromDevice.tr(),
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey.shade600,
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
