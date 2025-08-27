import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vnpt_task5/core/clean_arch_setup/extensions/view_abs.dart';
import 'package:vnpt_task5/injector.dart';
import 'package:vnpt_task5/module/startup/authorizeCitizenID/app/viewModel/stepper_view_model.dart';

class AuthorizeStepper extends StatefulWidget {
  final Color? activeColor;
  final Color? completedColor;
  final Color? inactiveColor;
  final double? height;
  final bool showContent;
  final StepperViewModel? viewModel;

  const AuthorizeStepper({
    super.key,
    this.activeColor,
    this.completedColor,
    this.inactiveColor,
    this.height,
    this.showContent = false,
    this.viewModel,
  });

  @override
  State<AuthorizeStepper> createState() => _AuthorizeStepperState();
}

class _AuthorizeStepperState
    extends ViewState<AuthorizeStepper, StepperViewModel> {
  @override
  createViewModel() => widget.viewModel ?? injector<StepperViewModel>();

  @override
  void initState() {
    super.initState();
    // Set callback để rebuild UI khi state thay đổi (chỉ khi không có external viewModel)
    if (widget.viewModel == null) {
      viewModel.setStateChangeCallback(() {
        if (mounted) {
          setState(() {});
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: widget.height ?? 60.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.white,
                colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary:
                      widget.activeColor ??
                      Colors.blue, // Màu cho step hiện tại (active)
                  onPrimary: Colors.white, // Màu text/icon trên step active
                  secondary:
                      widget.completedColor ??
                      Colors.green, // Màu cho step hoàn thành (done)
                  onSecondary:
                      Colors.white, // Màu text/icon trên step completed
                  onSurface:
                      widget.inactiveColor ??
                      Colors.grey, // Màu cho step inactive
                ),
              ),
              child: Stepper(
                elevation: 0,
                currentStep: viewModel.currentStep,
                stepIconHeight: 30.r,
                stepIconWidth: 30.r,
                type: StepperType.horizontal,
                controlsBuilder: (context, details) {
                  return const SizedBox.shrink();
                },
                connectorColor: WidgetStateProperty.resolveWith<Color>((
                  states,
                ) {
                  if (states.contains(WidgetState.disabled)) {
                    return widget.inactiveColor ?? Colors.grey.shade300;
                  }
                  return widget.completedColor ?? Colors.green;
                }),
                steps: widget.showContent
                    ? viewModel.flutterSteps
                    : _buildMinimalSteps(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build minimal steps (chỉ hiển thị stepper, không có content)
  List<Step> _buildMinimalSteps() {
    return viewModel.screens.asMap().entries.map((entry) {
      int index = entry.key;

      return Step(
        title: const Text(''),
        content: const SizedBox.shrink(),
        isActive: index <= viewModel.currentStep,
        state: viewModel.getStepState(index),
        stepStyle: _getStepStyle(index),
      );
    }).toList();
  }

  // Custom step style based on state
  StepStyle _getStepStyle(int index) {
    final stepState = viewModel.getStepState(index);

    Color stepColor;
    Color connectorColor;

    switch (stepState) {
      case StepState.complete:
        stepColor = widget.completedColor ?? Colors.green;
        connectorColor = widget.completedColor ?? Colors.green;
        break;
      case StepState.indexed:
      case StepState.editing:
        stepColor = widget.activeColor ?? Colors.blue;
        connectorColor = widget.activeColor ?? Colors.blue;
        break;
      case StepState.disabled:
      default:
        stepColor = widget.inactiveColor ?? Colors.grey;
        connectorColor = widget.inactiveColor ?? Colors.grey.shade300;
        break;
    }

    return StepStyle(
      color: stepColor,
      connectorColor: connectorColor,
      indexStyle: TextStyle(
        color: Colors.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
