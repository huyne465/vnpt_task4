import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vnpt_task5/core/clean_arch_setup/extensions/view_abs.dart';
import 'package:vnpt_task5/core/ui/general_widget/stf_widget/authorize_stepper.dart';
import 'package:vnpt_task5/core/ui/general_widget/stf_widget/stepper_control_buttons.dart';
import 'package:vnpt_task5/core/ui/general_widget/stl_widget/authorize_app_bar.dart';
import 'package:vnpt_task5/injector.dart';
import 'package:vnpt_task5/module/startup/authorizeCitizenID/app/ui/widgets/step_1_content.dart';
import 'package:vnpt_task5/module/startup/authorizeCitizenID/app/ui/widgets/step_2_content.dart';
import 'package:vnpt_task5/module/startup/authorizeCitizenID/app/ui/widgets/step_3_content.dart';
import 'package:vnpt_task5/module/startup/authorizeCitizenID/app/ui/widgets/step_4_content.dart';
import 'package:vnpt_task5/module/startup/authorizeCitizenID/app/viewModel/stepper_view_model.dart';

class AuthorizeScreen extends StatefulWidget {
  const AuthorizeScreen({super.key});

  @override
  State<AuthorizeScreen> createState() => _AuthorizeScreenState();
}

//implement viewModel
class _AuthorizeScreenState
    extends ViewState<AuthorizeScreen, StepperViewModel> {
  @override
  createViewModel() => injector<StepperViewModel>();

  @override
  void initState() {
    super.initState();
    // Set callback để rebuild UI khi state thay đổi
    viewModel.setStateChangeCallback(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(26.h),
        child: const AuthorizeAppBar(),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Stepper với step icons
            AuthorizeStepper(viewModel: viewModel),
            // Current step content
            Container(child: _buildCurrentStepContent()),
            // Control buttons
            StepperControlButtons(viewModel: viewModel),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentStepContent() {
    // Instead of calling screenBuilder which could cause recursion,
    // directly build the content for the current step
    switch (viewModel.currentStep) {
      case 0:
        return Step1Content();
      case 1:
        return Step2Content();
      case 2:
        return Step3Content();
      case 3:
        return Step4Content();
      default:
        return Step1Content();
    }
  }
}
