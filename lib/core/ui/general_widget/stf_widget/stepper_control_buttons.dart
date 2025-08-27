import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vnpt_task5/generated/locale_keys.g.dart';
import 'package:vnpt_task5/module/startup/authorizeCitizenID/app/viewModel/stepper_view_model.dart';

class StepperControlButtons extends StatelessWidget {
  final StepperViewModel viewModel;
  final VoidCallback? onCompleted;
  final EdgeInsets? padding;

  const StepperControlButtons({
    super.key,
    required this.viewModel,
    this.onCompleted,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          // Back Button
          if (viewModel.canGoBack) ...[
            Expanded(child: _buildBackButton()),
            SizedBox(width: 18.w),
          ],

          // Next/Complete Button
          Expanded(child: _buildNextButton()),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return ElevatedButton(
      onPressed: viewModel.isLoading ? null : viewModel.goToPreviousStep,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: const BorderSide(color: Colors.black, width: 1),
        ),
      ),
      child: Text(
        LocaleKeys.button_previous.tr(),
        style: TextStyle(
          color: Colors.black87,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    final isLastStep = viewModel.isLastStep;
    final buttonText = isLastStep
        ? LocaleKeys.button_complete.tr()
        : LocaleKeys.button_next.tr();
    final isLoading = viewModel.isLoading;

    return ElevatedButton(
      onPressed: isLoading
          ? null
          : () {
              if (isLastStep) {
              } else {
                viewModel.completeCurrentStep();
              }
            },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[900],
        padding: EdgeInsets.symmetric(vertical: 12.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: isLoading
          ? SizedBox(
              width: 20.w,
              height: 20.h,
              child: const CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (!isLastStep) ...[
                  SizedBox(width: 8.w),
                  Icon(Icons.arrow_forward, size: 16.sp, color: Colors.white),
                ],
              ],
            ),
    );
  }
}
