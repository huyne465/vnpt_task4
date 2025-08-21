import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vnpt_task4/constants/app_constants.dart';
import 'package:vnpt_task4/constants/app_textStyle.dart';
import 'package:vnpt_task4/generated/assets.gen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(15.w),
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
                            radius: 50.r,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 49.r,
                              backgroundImage: Assets.images.aki.image().image,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        //username
                        Text(
                          AppConstants.profileName,
                          style: textStyleLargeBold,
                        ),
                        SizedBox(height: 8.h),
                        //user email
                        Text(AppConstants.userEmail, style: textStyleMedium),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15.w),
                child: Card(
                  elevation: 8,
                  shadowColor: Colors.black.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Container(
                    height: 100.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.white,
                    ),
                    child: Column(children: [Container(), Container()]),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
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
            ],
          ),
        ),
      ),
    );
  }
}
