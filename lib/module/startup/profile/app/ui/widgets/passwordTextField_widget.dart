import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vnpt_task4/constants/app_constants.dart';
import 'package:vnpt_task4/core/extenstion/requiredLabel_ex.dart';

class PasswordFormTextField extends StatefulWidget {
  final TextEditingController currentPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  final bool showPassword;
  final bool showNewPassword;
  final bool showConfirmNewPassword;
  final Function(bool) onShowPassword;
  final Function(bool) onShowNewPassword;
  final Function(bool) onShowConfirmNewPassword;

  const PasswordFormTextField({
    super.key,
    required this.confirmPasswordController,
    required this.currentPasswordController,
    required this.newPasswordController,
    required this.showPassword,
    required this.onShowPassword,
    required this.onShowNewPassword,
    required this.onShowConfirmNewPassword,
    required this.showNewPassword,
    required this.showConfirmNewPassword,
  });

  @override
  State<PasswordFormTextField> createState() => _PasswordFormTextFieldState();
}

class _PasswordFormTextFieldState extends State<PasswordFormTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RequiredLabel(text: AppConstants.currentPassword),
        SizedBox(height: 5.h),
        TextField(
          maxLines: 1,
          controller: widget.currentPasswordController,
          style: TextStyle(color: Colors.black, fontSize: 12.sp),
          obscureText: !widget.showPassword,
          decoration: InputDecoration(
            hintText: AppConstants.currentPasswordHintText,
            suffixIcon: widget.showPassword
                ? InkWell(
                    onTap: () {
                      widget.onShowPassword(false);
                    },
                    child: const Icon(
                      Icons.visibility,
                      color: Color.fromRGBO(177, 177, 177, 1),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      widget.onShowPassword(true);
                    },
                    child: const Icon(
                      Icons.visibility_off,
                      color: Color.fromRGBO(177, 177, 177, 1),
                    ),
                  ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(
                color: Color.fromRGBO(177, 177, 177, 1),
                width: 1,
              ),
            ),
            filled: true,
            hintStyle: const TextStyle(color: Color.fromRGBO(177, 177, 177, 1)),
            fillColor: Colors.transparent,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(177, 177, 177, 1),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(177, 177, 177, 1),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        SizedBox(height: 25.h),

        RequiredLabel(text: AppConstants.newPassword),
        SizedBox(height: 5.h),
        TextField(
          maxLines: 1,
          controller: widget.newPasswordController,
          style: TextStyle(color: Colors.black, fontSize: 12.sp),
          obscureText: !widget.showNewPassword,
          decoration: InputDecoration(
            hintText: AppConstants.newPasswordHintText,
            suffixIcon: !widget.showNewPassword
                ? InkWell(
                    onTap: () {
                      widget.onShowNewPassword(false);
                    },
                    child: const Icon(
                      Icons.visibility,
                      color: Color.fromRGBO(177, 177, 177, 1),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      widget.onShowNewPassword(true);
                    },
                    child: const Icon(
                      Icons.visibility_off,
                      color: Color.fromRGBO(177, 177, 177, 1),
                    ),
                  ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(
                color: Color.fromRGBO(177, 177, 177, 1),
                width: 1,
              ),
            ),
            filled: true,
            hintStyle: const TextStyle(color: Color.fromRGBO(177, 177, 177, 1)),
            fillColor: Colors.transparent,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(177, 177, 177, 1),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(177, 177, 177, 1),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        SizedBox(height: 25.h),

        RequiredLabel(text: AppConstants.confirmNewPassword),
        SizedBox(height: 5.h),
        TextField(
          maxLines: 1,
          controller: widget.confirmPasswordController,
          style: TextStyle(color: Colors.black, fontSize: 12.sp),
          obscureText: !widget.showConfirmNewPassword,
          decoration: InputDecoration(
            hintText: AppConstants.confirmNewPasswordHintText,
            suffixIcon: widget.showConfirmNewPassword
                ? InkWell(
                    onTap: () {
                      widget.onShowConfirmNewPassword(false);
                    },
                    child: const Icon(
                      Icons.visibility,
                      color: Color.fromRGBO(177, 177, 177, 1),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      widget.onShowConfirmNewPassword(true);
                    },
                    child: const Icon(
                      Icons.visibility_off,
                      color: Color.fromRGBO(177, 177, 177, 1),
                    ),
                  ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(
                color: Color.fromRGBO(177, 177, 177, 1),
                width: 1,
              ),
            ),
            filled: true,
            hintStyle: const TextStyle(color: Color.fromRGBO(177, 177, 177, 1)),
            fillColor: Colors.transparent,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(177, 177, 177, 1),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(177, 177, 177, 1),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
