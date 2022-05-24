import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hoyorder/modules/auth/views/screen/login.dart';
import 'package:hoyorder/modules/home/controller/home_controller.dart';
import 'package:hoyorder/modules/home/views/screens/byeType.dart';
import 'package:hoyorder/modules/home/views/screens/home.dart';
import 'package:hoyorder/modules/main/controller/main_controller.dart';
import 'package:hoyorder/modules/main/views/screens/main_screen.dart';

import 'constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var controller = Get.put(MainController());
 var controller1 = Get.put(HomeController());
  @override
  void initState() {
    controller.getCategory();
   controller1.getPrice();
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(userInfo == null ? LoginScreen() : MainScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage(
                'assets/images/logo.jpg',
              ),
              width: 182.w,
              height: 160.h,
            ),
            Text(
              'HoY Order',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 22.sp),
            )
          ],
        ),
      ),
    );
  }
}
