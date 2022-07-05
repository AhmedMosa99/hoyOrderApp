import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hoyorder/services/shared_pref.dart';
import 'package:hoyorder/utils/bindings.dart';
import 'package:hoyorder/utils/constant.dart';
import 'package:hoyorder/utils/languages/lang.dart';
import 'package:hoyorder/utils/splash_screen.dart';
import 'package:hoyorder/utils/themeing/theme_data.dart';

import 'modules/auth/models/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  userInfo = await SharePref.getData(key: 'userInfo') == null
      ? null
      : LoginModel.fromJson(
          json.decode(await SharePref.getData(key: 'userInfo')));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_) => GetMaterialApp(
          smartManagement: SmartManagement.keepFactory,
          translations: Messages(),
          locale: Locale('en'),
          fallbackLocale: const Locale('en', 'Us'),
          initialBinding: Binding(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: lightTheme,
          home: const SplashScreen()),
    );
  }
}
