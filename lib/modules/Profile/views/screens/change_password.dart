import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hoyorder/modules/Profile/controller/profile_controller.dart';
import 'package:hoyorder/utils/component/component.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:const Icon(Icons.arrow_back_ios),color: Colors.white,onPressed: (){
          Get.back();
        },),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        shadowColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Change Password ",
        style: Theme.of(context)
        .textTheme
        .headline3!
        .copyWith(fontWeight: FontWeight.w600,
    color: Colors.white,
    fontSize: 18.sp
    ),
      ),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              child: Form(
                key: controller.keyPass,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Current Password",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      height: 54.h,
                      width: double.infinity,
                      child: defaultFormField(
                        controller: controller.passwordControllerOld,
                        type: TextInputType.text,
                        isPassword: controller.isPassword,
                        suffix: Icon(controller.iconPass, color: Colors.black),
                        suffixPressed: () {
                          controller.changeVisible(!controller.isPassword);
                        },
                        hintText: "Current Password",
                        validate: (val) {
                          if (val!.trim().isEmpty) return 'Enter Field';
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "New password",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      height: 54.h,
                      width: double.infinity,
                      child: defaultFormField(
                        validate: (val) {
                          if (val!.trim().isEmpty) return 'ادخل الحقل';
                          return null;
                        },
                        controller: controller.passwordControllerNew,
                        type: TextInputType.text,
                        isPassword: controller.isPassword,
                        suffix: Icon(controller.iconPass, color: Colors.black),
                        suffixPressed: () {
                          controller.changeVisible(!controller.isPassword);
                        },
                        hintText: "new password",
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    SizedBox(
                      height: 44.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text('Change Password'),
                        onPressed: () async {
                          if (controller.keyPass.currentState!.validate()) {
                            try {
                              await controller.changePassAndEditProfile(
                                phone: '',
                                pastPassword:
                                    controller.passwordControllerOld.text,
                                newPassword:
                                    controller.passwordControllerNew.text,
                                email: '',
                                image: '',
                                name: '',
                                city: '',
                                street: '',
                                streetNumber: '',
                              );
                              controller.passwordControllerOld.text = '';
                              controller.passwordControllerNew.text = '';
                              Get.back();
                            } on Exception {
                              // ODO
                              Get.snackbar(
                                'Error',
                                'Password error',
                                duration: const Duration(seconds: 2),
                              );
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SizedBox(
                      height: 44.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            alignment: Alignment.center,
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            primary: const Color(0xFF777877).withOpacity(.9),
                            elevation: 0,
                            fixedSize: Size(double.infinity, 48.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        child: const Text(
                          'Cancel',

                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
