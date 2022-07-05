import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hoyorder/modules/auth/views/widgets/signup_widget.dart';
import 'package:hoyorder/modules/main/controller/main_controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var controller = Get.put(MainController());
  @override
  void initState() {
    // TODO: implement initState
    controller.getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 16.w),
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    child: Center(
                        child: Image.asset(
                      'assets/images/logo.jpg',
                      width: 150.w,
                      height: 120.h,
                    )),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  SignUpWidget(),
                ],
              )))),
    );
  }
}
