import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hoyorder/modules/auth/views/widgets/login_widget.dart';
import 'package:hoyorder/modules/main/controller/main_controller.dart';
import 'package:hoyorder/modules/main/views/screens/main_screen.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 80.w,
                        height: 50.h,
                        child: IconButton(
                            onPressed: () {
                              Get.offAll(MainScreen());
                            },
                            icon: Text(
                              'Try it'.tr,
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                            )),
                      )),
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
                    height: 38.h,
                  ),
                  const LoginWidget(),
                ],
              )))),
    );
  }
}
