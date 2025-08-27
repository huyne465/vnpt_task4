import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vnpt_task5/core/clean_arch_setup/abstraction/app_view_model.dart';
import 'package:vnpt_task5/core/clean_arch_setup/extensions/unit.dart';
import 'package:vnpt_task5/generated/locale_keys.g.dart';
import 'package:vnpt_task5/module/startup/authorizeCitizenID/data/step.dart';
import 'package:vnpt_task5/module/startup/authorizeCitizenID/app/ui/widgets/step_1_content.dart';
import 'package:vnpt_task5/module/startup/authorizeCitizenID/app/ui/widgets/step_2_content.dart';
import 'package:vnpt_task5/module/startup/authorizeCitizenID/app/ui/widgets/step_3_content.dart';
import 'package:vnpt_task5/module/startup/authorizeCitizenID/app/ui/widgets/step_4_content.dart';

@injectable
class StepperViewModel extends AppViewModel {
  int _currentStep = 0;
  bool _isLoading = false;
  List<StepData>? _cachedScreens;
  VoidCallback? _onStateChanged; // Callback để notify UI

  //getters
  int get currentStep => _currentStep;
  bool get isLoading => _isLoading;
  int get totalSteps => screens.length;

  // Setter cho callback
  void setStateChangeCallback(VoidCallback callback) {
    _onStateChanged = callback;
  }

  // Method để notify state change
  void _notifyStateChanged() {
    _onStateChanged?.call();
  }

  //navigate helpers
  bool get canGoNext => currentStep < screens.length - 1;
  bool get canGoBack => currentStep > 0;
  bool get isLastStep => currentStep == screens.length - 1;

  List<StepData> get screens {
    // Cache the screens to prevent recreating them every time
    _cachedScreens ??= [
      StepData(
        title: LocaleKeys.authorizeStep_step1.tr(),
        screenBuilder: () => _buildStep1Content(),
        isRequired: true,
      ),
      StepData(
        title: LocaleKeys.authorizeStep_step2.tr(),
        screenBuilder: () => _buildStep2Content(),
        isRequired: true,
      ),
      StepData(
        title: LocaleKeys.authorizeStep_step3.tr(),
        screenBuilder: () => _buildStep3Content(),
        isRequired: true,
      ),
      StepData(
        title: LocaleKeys.success_title.tr(),
        screenBuilder: () => _buildStep4Content(),
        isRequired: false,
      ),
    ];
    return _cachedScreens!;
  }

  // Step content builders - these should be lightweight content widgets, not full screens
  Widget _buildStep1Content() {
    return const Step1Content();
  }

  Widget _buildStep2Content() {
    return const Step2Content();
  }

  Widget _buildStep3Content() {
    return const Step3Content();
  }

  Widget _buildStep4Content() {
    return const Step4Content();
  }

  // Convert to Flutter Steps - recreate when step changes
  List<Step> get flutterSteps {
    return screens.asMap().entries.map((entry) {
      int index = entry.key;
      StepData stepData = entry.value;

      return Step(
        title: const Text(''), // Empty vì dùng custom stepIconBuilder
        content: stepData.screenBuilder(),
        isActive: index <= _currentStep,
        state: getStepState(index),
      );
    }).toList();
  }

  // Xác định trạng thái của step
  StepState getStepState(int index) {
    if (index < _currentStep) {
      return StepState.complete;
    } else if (index == _currentStep) {
      return _isLoading ? StepState.editing : StepState.indexed;
    } else {
      return StepState.disabled;
    }
  }

  // Navigation methods
  void goToNextStep() {
    if (canGoNext && validateCurrentStep()) {
      _currentStep++;
      _notifyStateChanged(); // Notify UI to rebuild
      onStepChanged(_currentStep);
    }
  }

  void goToPreviousStep() {
    if (canGoBack) {
      _currentStep--;
      _notifyStateChanged(); // Notify UI to rebuild
      onStepChanged(_currentStep);
    }
  }

  // Loading state management - override từ AppViewModel
  @override
  Future<Unit> showLoading() async {
    _isLoading = true;
    _notifyStateChanged(); // Notify UI when loading state changes
    return await super.showLoading();
  }

  @override
  Future<Unit> hideLoading() async {
    _isLoading = false;
    _notifyStateChanged(); // Notify UI when loading state changes
    return await super.hideLoading();
  }

  // Validation
  bool validateCurrentStep() {
    // Override này trong subclass cho logic validation riêng
    switch (_currentStep) {
      case 0:
        return validateStep1();
      case 1:
        return validateStep2();
      case 2:
        return validateStep3();
      case 3:
        return validateStep4();
      default:
        return true;
    }
  }

  // Virtual validation methods - override trong subclass
  bool validateStep1() => true;
  bool validateStep2() => true;
  bool validateStep3() => true;
  bool validateStep4() => true;

  // Complete current step với animation
  Future<void> completeCurrentStep() async {
    if (!validateCurrentStep()) return;

    if (canGoNext) {
      goToNextStep();
    }
  }

  // Handle final completion
  Future<void> handleCompletion() async {
    await showLoading();

    try {
      // Implement your completion logic here
      await Future.delayed(const Duration(seconds: 2));

      // Show success or navigate
      onCompletionSuccess();
    } catch (error) {
      onCompletionError(error.toString());
    } finally {
      await hideLoading();
    }
  }

  // Callbacks - override trong subclass
  void onCompletionSuccess() {
    // Override để xử lý khi hoàn thành thành công
  }

  void onCompletionError(String error) {
    // Override để xử lý khi có lỗi
  }

  void onStepChanged(int newStep) {
    // Override để xử lý khi step thay đổi
  }

  @override
  void disposeState() {
    _cachedScreens = null;
    super.disposeState();
  }
}
