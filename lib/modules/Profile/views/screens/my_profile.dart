import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hoyorder/modules/Profile/controller/profile_controller.dart';
import 'package:hoyorder/modules/Profile/views/screens/edit_profile.dart';
import 'package:hoyorder/modules/Profile/views/screens/language.dart';
import 'package:hoyorder/modules/Profile/views/screens/rate_screen.dart';
import 'package:hoyorder/modules/Profile/views/screens/support.dart';
import 'package:hoyorder/modules/Profile/views/widgets/no_auth.dart';
import 'package:hoyorder/modules/auth/controller/auth.dart';
import 'package:hoyorder/modules/orders/views/screens/order_screen.dart';
import 'package:hoyorder/utils/constant.dart';

class MyProfile extends StatelessWidget {
  MyProfile({Key? key}) : super(key: key);
  final put = Get.put(ProfileController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        shadowColor: Colors.white,
        centerTitle: true,
        title: Text(
          "My Profile",
          style: Theme.of(context).textTheme.headline3!.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 18.sp),
        ),
      ),
      body: null == userInfo
          ? DoubleBack(
              message: "Press back again to close".tr,
              child: Center(
                child: NoAuth(),
              ),
            )
          : Directionality(
              textDirection: Get.locale.toString() == "ar"
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: DoubleBack(
                message: "Press back again to close".tr,
                child: SingleChildScrollView(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    child: Column(
                      children: [
                        GetBuilder<ProfileController>(builder: (logic) {
                          return Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 80.w,
                                  height: 80.h,
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor:
                                        const Color(0xFF007F80).withOpacity(.1),
                                    backgroundImage: imageChoice(logic),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    userInfo!.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(fontSize: 18.sp),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Get.to(const EditScreen());
                                      },
                                      icon: Image.asset(
                                        'assets/images/edit.png',
                                        width: 20.w,
                                        height: 20.h,
                                      )),
                                ],
                              ),
                            ],
                          );
                        }),
                        SizedBox(
                          height: 38.h,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const OrderScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 44.w,
                                    height: 44.h,
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xFF007F80)
                                          .withOpacity(.1),
                                      child: SvgPicture.asset(
                                        'assets/images/order.svg',
                                        width: 20.w,
                                        height: 20.h,
                                        color: const Color(0xff007F80),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Text('Orders'.tr),
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: (20),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 36.h,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(LanguageScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 44.w,
                                    height: 44.h,
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xFF007F80)
                                          .withOpacity(.1),
                                      child: SvgPicture.asset(
                                        'assets/images/lnan.svg',
                                        width: 20.w,
                                        height: 20.h,
                                        color: const Color(0xff007F80),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Text('Languge'.tr),
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: (20),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 36.h,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const RateScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 44.w,
                                    height: 44.h,
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xFF007F80)
                                          .withOpacity(.1),
                                      child: SvgPicture.asset(
                                        'assets/images/Icon rate color.svg',
                                        width: 20.w,
                                        height: 20.h,
                                        color: const Color(0xff007F80),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Text('Store Rating'.tr),
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: (20),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 36.h,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const SupportScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 44.w,
                                    height: 44.h,
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xFF007F80)
                                          .withOpacity(.1),
                                      child: SvgPicture.asset(
                                        'assets/images/Icon support color.svg',
                                        width: 20.w,
                                        height: 20.h,
                                        color: const Color(0xff007F80),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Text('Support Center'.tr),
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: (20),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 36.h,
                        ),
                        GetBuilder<AuthController>(
                          builder: (c) {
                            return InkWell(
                              onTap: () async {
                                await c.logout();
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 44.w,
                                        height: 44.h,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              const Color(0xFF007F80)
                                                  .withOpacity(.1),
                                          child: SvgPicture.asset(
                                            'assets/images/Icon signout color.svg',
                                            width: 20.w,
                                            height: 20.h,
                                            color: const Color(0xff007F80),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Text('Logout'.tr),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: (20),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  ImageProvider imageChoice(logic) {
    if ((userInfo!.image.isNotEmpty) &&
        (!(userInfo!.image.split('/').last.length < 9))) {
      return NetworkImage(
        userInfo!.image,
      );
    } else {
      return const AssetImage(
        'assets/images/memoji-2.png',
      );
    }
  }
}
