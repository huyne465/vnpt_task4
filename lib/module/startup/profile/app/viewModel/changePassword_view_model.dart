import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:vnpt_task4/core/clean_arch_setup/abstraction/app_viewModel.dart';
import 'package:vnpt_task4/core/clean_arch_setup/extension/unit.dart';
import 'package:vnpt_task4/core/route/app_route.dart';

@injectable
class ChangePasswordViewModel extends AppViewModel {
  final _showPassword = false.obs;
  final _showNewPassword = false.obs;
  final _showConfirmNewPassword = false.obs;
  final _userCurrentPassword = TextEditingController();
  final _userNewPassword = TextEditingController();
  final _userConfirmNewPassword = TextEditingController();

  bool get showPassword => _showPassword.value;
  bool get showNewPassword => _showNewPassword.value;
  bool get showConfirmNewPassword => _showConfirmNewPassword.value;
  TextEditingController get userCurrentPassword => _userCurrentPassword;
  TextEditingController get userNewPassword => _userNewPassword;
  TextEditingController get userConfirmNewPassword => _userConfirmNewPassword;

  Future<Unit> onShowPassword(bool value) async {
    _showPassword.value = !_showPassword.value;
    return unit;
  }

  Future<Unit> onShowNewPassword(bool value) async {
    _showNewPassword.value = !_showNewPassword.value;
    return unit;
  }

  Future<Unit> onShowConfirmNewPassword(bool value) async {
    _showConfirmNewPassword.value = !_showConfirmNewPassword.value;
    return unit;
  }

  Future<Unit> onGoBack() async {
    await Get.offNamed(AppRoutes.profile);
    return unit;
  }

  Future<Unit> onChangePassword() async {
    // Implement your change password logic here
    return unit;
  }

  void onDisposeState() {
    _userCurrentPassword.dispose();
    _userNewPassword.dispose();
    _userConfirmNewPassword.dispose();
  }
}
