import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hoyorder/modules/auth/views/widgets/reset_password.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    child: Center(
                        child: Image.asset(
                      'assets/images/logo.jpg',
                      width: 150.w,
                      height: 94.h,
                    )),
                  ),
                  Center(
                    child: Text(
                      'HoY Order',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 22.sp),
                    ),
                  ),
                  SizedBox(
                    height: 38.h,
                  ),
                  const ResetWidget(),
                ],
              )))),
    );
  }
}
