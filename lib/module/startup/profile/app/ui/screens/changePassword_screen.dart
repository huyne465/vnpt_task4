import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vnpt_task4/constants/app_constants.dart';
import 'package:vnpt_task4/constants/app_textStyle.dart';
import 'package:vnpt_task4/core/clean_arch_setup/extension/view_abs.dart';
import 'package:vnpt_task4/core/helper/ErrorSnackbar_helper.dart';
import 'package:vnpt_task4/injector.dart';
import 'package:vnpt_task4/module/startup/profile/app/ui/widgets/passwordTextField_widget.dart';
import 'package:vnpt_task4/module/startup/profile/app/ui/widgets/ruleWidget.dart';
import 'package:vnpt_task4/module/startup/profile/app/ui/widgets/warning_text_widget.dart';
import 'package:vnpt_task4/module/startup/profile/app/viewModel/changePassword_view_model.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState
    extends ViewState<ChangePasswordScreen, ChangePasswordViewModel> {
  @override
  createViewModel() => getIt<ChangePasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          AppConstants.changePasswordTitle,
          style: changePasswordTitle,
        ),
        leading: IconButton(
          onPressed: () {
            viewModel.onGoBack();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              WarningTextWidget(
                textStyle: textStyleSmall.copyWith(color: Colors.grey[600]),
                requiredStyle: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 25.h),
              Obx(
                () => PasswordFormTextField(
                  currentPasswordController: viewModel.userCurrentPassword,
                  newPasswordController: viewModel.userNewPassword,
                  confirmPasswordController: viewModel.userConfirmNewPassword,
                  showPassword: viewModel.showPassword,
                  showNewPassword: viewModel.showNewPassword,
                  showConfirmNewPassword: viewModel.showConfirmNewPassword,
                  onShowPassword: (value) {
                    viewModel.onShowPassword(value);
                  },
                  onShowNewPassword: (value) {
                    viewModel.onShowNewPassword(value);
                  },
                  onShowConfirmNewPassword: (value) {
                    viewModel.onShowConfirmNewPassword(value);
                  },
                ),
              ),

              SizedBox(height: 25.h),
              Column(
                children: [
                  RuleWidget(rule: AppConstants.passwordRule1),
                  SizedBox(height: 5.h),
                  RuleWidget(rule: AppConstants.passwordRule2),
                  SizedBox(height: 5.h),
                  RuleWidget(rule: AppConstants.passwordRule3),
                  SizedBox(height: 5.h),
                  RuleWidget(rule: AppConstants.passwordRule4),
                  SizedBox(height: 5.h),
                  RuleWidget(rule: AppConstants.passwordRule5),
                ],
              ),

              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 125.h),
                child: ElevatedButton(
                  onPressed: () {
                    showSnackBar('Change password unsuccessful');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(AppConstants.changePasswordTitle, style: button),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
