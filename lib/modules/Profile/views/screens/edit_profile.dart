import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hoyorder/modules/Profile/controller/profile_controller.dart';
import 'package:hoyorder/modules/Profile/views/screens/change_password.dart';
import 'package:hoyorder/utils/component/component.dart';
import 'package:hoyorder/utils/constant.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final put = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    put.emailController.text = userInfo!.email;
    put.phoneController.text = userInfo!.phone;
    put.nameController.text = userInfo!.name;
    put.city.text = userInfo!.city;
    put.street.text = userInfo!.street;
    put.streetNumber.text = userInfo!.streetNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close_outlined),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_outlined),
            onPressed: () async {
              if (put.imagePicked != null) {
                await put.uploadImage();
              }
              if (put.keyEdit.currentState!.validate()) {
                await put.changePassAndEditProfile(
                    phone: put.phoneController.text,
                    pastPassword: '',
                    newPassword: '',
                    email: put.emailController.text,
                    image: '',
                    city: put.city.text,
                    street: put.street.text,
                    streetNumber: put.streetNumber.text,
                    name: put.nameController.text);
                Get.back();
              }
            },
          )
        ],
        centerTitle: true,
        title: Text(
          "My Profile",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: GetBuilder<ProfileController>(
            builder: (logic) {
              return Form(
                key: logic.keyEdit,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 96.w,
                            height: 96.h,
                            child: CircleAvatar(
                                radius: 25,
                                backgroundColor:
                                    const Color(0xFF007F80).withOpacity(.1),
                                backgroundImage: imageChoice(logic)),
                          ),
                          Positioned(
                            bottom: 7.h,
                            child: InkWell(
                              onTap: () async {
                                logic.showPicker(context);
                              },
                              child: SizedBox(
                                width: 28.w,
                                height: 28.h,
                                child: const CircleAvatar(
                                  backgroundColor: Color(0xFF007F80),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Text(
                      "Full Name",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    SizedBox(
                      height: 50.h,
                      width: double.infinity,
                      child: defaultFormField(
                        validate: (val) {
                          if (val!.trim().isEmpty) return 'Enter Your Name!';
                          return null;
                        },
                        type: TextInputType.text,
                        controller: logic.nameController,
                        hintText: "Enter Full Name",
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "Phone Number ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      height: 50.h,
                      width: double.infinity,
                      child: defaultFormField(
                        validate: (val) {
                          if (val!.trim().isEmpty ||
                              (!GetUtils.isPhoneNumber(val))) {
                            return 'Enter a vaild number';
                          }
                          return null;
                        },
                        type: TextInputType.number,
                        controller: logic.phoneController,
                        hintText: "000 000 000",
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "Email",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      height: 50.h,
                      width: double.infinity,
                      child: defaultFormField(
                        validate: (val) {
                          if (val!.trim().isEmpty || (!GetUtils.isEmail(val))) {
                            return 'Enter a vaild Email !';
                          }
                          return null;
                        },
                        type: TextInputType.text,
                        controller: logic.emailController,
                        hintText: "Enter Your Email",
                      ),
                    ),
                    Text(
                      "City",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      height: 50.h,
                      width: double.infinity,
                      child: defaultFormField(
                        validate: (val) {
                          if (val!.trim().isEmpty) {
                            return 'Enter a Your city !';
                          }
                          return null;
                        },
                        type: TextInputType.text,
                        controller: logic.city,
                        hintText: "Enter Your City",
                      ),
                    ),
                    Text(
                      "Street",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      height: 50.h,
                      width: double.infinity,
                      child: defaultFormField(
                        validate: (val) {
                          if (val!.trim().isEmpty) {
                            return 'Enter Your Street !';
                          }
                          return null;
                        },
                        type: TextInputType.text,
                        controller: logic.street,
                        hintText: "Enter Your Street",
                      ),
                    ),
                    Text(
                      "Apartment number",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      height: 50.h,
                      width: double.infinity,
                      child: defaultFormField(
                        validate: (val) {
                          if (val!.trim().isEmpty) {
                            return 'Enter a Apartment number !';
                          }
                          return null;
                        },
                        type: TextInputType.text,
                        controller: logic.streetNumber,
                        hintText: "Enter Your Apartment number",
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const ChangePasswordScreen());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 16.w,
                                height: 20.h,
                                child: SvgPicture.asset(
                                  'assets/images/Icon change color.svg',
                                  width: 20.w,
                                  height: 20.h,
                                  color: const Color(0xff007F80),
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text('change Password',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                          color:
                                              Theme.of(context).primaryColor)),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  ImageProvider imageChoice(logic) {
    if ((userInfo!.image.isNotEmpty) &&
        (!(userInfo!.image.split('/').last.length < 9))) {
      if (logic.imagePicked != null) {
        return FileImage(File(logic.imagePicked!.path));
      } else {
        return NetworkImage(userInfo!.image);
      }
    } else {
      return const AssetImage(
        'assets/images/memoji-2.png',
      );
    }
  }
}
