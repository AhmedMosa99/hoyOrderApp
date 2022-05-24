import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final lightTheme = ThemeData(
    tabBarTheme: const TabBarTheme(
        labelPadding: EdgeInsets.all(16),
        unselectedLabelColor: Color(0xff707070),
        labelColor: Color(0xff232f3e),
        indicator: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.white, width: 2)))),
    iconTheme: const IconThemeData(color: Color(0xff000000), size: 12),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
       selectedItemColor:  const Color(0xff232f3e),
        selectedLabelStyle:
            TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
        unselectedLabelStyle:
            TextStyle(fontSize: 11.sp, color: const Color(0xff707070)),
        unselectedItemColor: const Color(0xff999999)),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Color(0xff000000), size: 12),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
            statusBarColor: Color(0xffE8E8E8))),
    //  fontFamily: GoogleFonts.cairo().fontFamily,
    primaryColor: const Color(0xff232f3e),
    textTheme: TextTheme(
        subtitle2: TextStyle(fontSize: 12.sp, color: const Color(0xff242424)),
        subtitle1: TextStyle(fontSize: 14.sp, color: const Color(0xff707070)),
        headline2: TextStyle(
            fontSize: 21.sp,
            color: const Color(0xff242424),
            fontWeight: FontWeight.bold),
        headline3: TextStyle(
          fontSize: 16.sp,
          color: const Color(0xff242424),
        ),
        bodyText2: TextStyle(fontSize: 15.sp, color: const Color(0xff242424))),
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            alignment: Alignment.center,
            textStyle: TextStyle(
              //   fontFamily: GoogleFonts.cairo().fontFamily,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xffFAFAFA),
            ),
            primary: const Color(0xff232f3e),
            fixedSize: Size(double.infinity, 48.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)))));
