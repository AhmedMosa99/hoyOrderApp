import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hoyorder/modules/auth/views/screen/login.dart';

class NoAuth extends StatelessWidget {
  const NoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 80.w,
          height: 80.h,
          child: CircleAvatar(
            backgroundColor: const Color(0xFF007F80).withOpacity(.2),
            child: SvgPicture.asset('assets/images/Icon colorProfile.svg'),
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        const Text("Please log in "),
        SizedBox(
          height: 14.h,
        ),
        SizedBox(
            height: 44.h,
            width: 164.w,
            child: ElevatedButton(
                onPressed: () {
                  Get.offAll(() => LoginScreen());
                },
                child: const Text("Sign In")))
      ],
    );
  }
}
