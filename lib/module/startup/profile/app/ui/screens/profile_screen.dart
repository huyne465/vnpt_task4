import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vnpt_task4/constants/app_constants.dart';
import 'package:vnpt_task4/constants/app_textStyle.dart';
import 'package:vnpt_task4/core/clean_arch_setup/extension/view_abs.dart';
import 'package:vnpt_task4/generated/assets.gen.dart';
import 'package:vnpt_task4/injector.dart';
import 'package:vnpt_task4/module/startup/profile/app/ui/widgets/tab_profile_widget.dart';
import 'package:vnpt_task4/module/startup/profile/app/viewModel/profile_screen_view_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState
    extends ViewState<ProfileScreen, ProfileScreenViewModel> {
  @override
  createViewModel() => getIt<ProfileScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        margin: EdgeInsets.only(top: 50.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
              child: Card(
                elevation: 8.sp,
                shadowColor: Colors.black.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                color: Colors.white,
                child: Container(
                  height: 200.h,
                  width: 350.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 18.h),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.w),
                        ),
                        child: CircleAvatar(
                          radius: 40.r,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 39.r,
                            backgroundImage: Assets.images.aki.image().image,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      //username
                      Text(AppConstants.profileName, style: textStyleLargeBold),
                      SizedBox(height: 8.h),
                      //user email
                      Text(AppConstants.userEmail, style: textStyleSmall),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Card(
                elevation: 8,
                shadowColor: Colors.black.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Container(
                  height: 140.h,
                  width: 350.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TabProfileWidget(
                          onTap: () {},
                          title: AppConstants.tab1,
                          icon: Icons.business,
                          color: Colors.blue,
                          trailingIcon: Icons.arrow_forward_ios,
                          showTrailingIcon: true,
                        ),
                        Divider(height: 1.h, color: Colors.grey[300]),
                        TabProfileWidget(
                          onTap: () {
                            viewModel.onNavigate();
                          },
                          title: AppConstants.tab2,
                          icon: Icons.lock,
                          color: Colors.blue,
                          trailingIcon: Icons.arrow_forward_ios,
                          showTrailingIcon: true,
                        ),
                        Divider(height: 1.h, color: Colors.grey[300]),
                        TabProfileWidget(
                          onTap: () {},
                          title: AppConstants.tab3,
                          textStyle: logOutTab,
                          icon: Icons.logout,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Navigate to home
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigate to settings
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigate to settings
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigate to settings
              },
            ),
            IconButton(
              icon: const Icon(Icons.person, color: Colors.purple),
              onPressed: () {
                // Navigate to settings
              },
            ),
          ],
        ),
      ),
    );
  }
}
