import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hoyorder/modules/auth/controller/auth.dart';
import 'package:hoyorder/utils/component/component.dart';

class ResetWidget extends StatelessWidget {
  const ResetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return Form(
            key: controller.keyReset,
            child: Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Did you forget your password ?".tr,
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Enter your email and we will send you a link to reset your password.'
                      .tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  "Email".tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  height: 44.h,
                  width: double.infinity,
                  child: defaultFormField(
                    type: TextInputType.text,
                    controller: controller.emailForgetController,
                    validate: (val) {
                      if (val!.trim().isEmpty || (!GetUtils.isEmail(val))) {
                        return 'Enter a valid email !'.tr;
                      }
                      return null;
                    },
                    hintText: "Enter your email".tr,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 44.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.resetPassword();
                    },
                    child: Text('Send'.tr),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
