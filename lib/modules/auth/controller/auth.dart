import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoyorder/modules/Profile/controller/profile_controller.dart';
import 'package:hoyorder/modules/auth/models/login.dart';
import 'package:hoyorder/modules/auth/views/screen/login.dart';
import 'package:hoyorder/modules/home/controller/home_controller.dart';
import 'package:hoyorder/modules/home/views/screens/byeType.dart';
import 'package:hoyorder/modules/main/controller/main_controller.dart';
import 'package:hoyorder/modules/main/views/screens/main_screen.dart';
import 'package:hoyorder/services/data_fetch.dart';
import 'package:hoyorder/services/shared_pref.dart';
import 'package:hoyorder/utils/constant.dart';

class AuthController extends GetxController {
  bool isPassword = true;
  var iconPass = Icons.visibility_off_outlined;
  var keyLogin = GlobalKey<FormState>();
  var keyRegister = GlobalKey<FormState>();
  var keyReset = GlobalKey<FormState>();
  var phoneControllerLogin = TextEditingController();
  var emailControllerSignUp = TextEditingController();
  var phoneControllerSignUp = TextEditingController();
  var emailForgetController = TextEditingController();
  var passwordControllerLogin = TextEditingController();
  var passwordControllerSignUp = TextEditingController();
  var nameController = TextEditingController();
  var city = TextEditingController();
  var country = TextEditingController();
  var alterPhoneNumber = TextEditingController();
  var street = TextEditingController();
  var streetNumber = TextEditingController();
  String countryCode = '+971';

  changeVisible(bool val) {
    isPassword = val;
    iconPass = isPassword ? Icons.visibility_off_outlined : Icons.visibility;
    update();
  }

  checkLogin(String phone, String password) async {
    print('$countryCode$phone');
    if (keyLogin.currentState!.validate()) {
      try {
        final data = await DioHandler.apiHelper
            .fetchLogin('$countryCode$phone', password);
        await SharePref.setData(key: 'userInfo', data: json.encode(data));
        final val = await SharePref.getData(key: 'userInfo');
        userInfo = LoginModel.fromJson(json.decode(val));
        Get.offAll(() => MainScreen());
      } catch (e) {
        throw Exception();
      }
    }
  }

  checkRegister({
    required String phone,
    required String password,
    required String name,
    required String email,
  }) async {
    if (keyRegister.currentState!.validate()) {
      final data = await DioHandler.apiHelper.fetchRegister(
          '$countryCode$phone', password, email, name, Get.locale.toString());
      await SharePref.setData(key: 'userInfo', data: json.encode(data));
      final val = await SharePref.getData(key: 'userInfo');
      userInfo = LoginModel.fromJson(json.decode(val));
      var controller = Get.put(HomeController());
      controller.conectPusher();
      Get.offAll(() => MainScreen());
    }
  }

  resetPassword() async {
    if (keyReset.currentState!.validate()) {
      try {
        var data = await DioHandler.apiHelper
            .resetPassword(emailForgetController.text, Get.locale.toString());
        Get.snackbar('', data);
      } catch (e) {
        throw Exception();
      }
    }
  }

  logout() async {
    await SharePref.removeKey('userInfo');
    userInfo = null;
    Get.offAll(LoginScreen());
    phoneControllerLogin.clear();
    emailControllerSignUp.clear();
    phoneControllerSignUp.clear();
    emailForgetController.clear();
    passwordControllerLogin.clear();
    passwordControllerSignUp.clear();
    nameController.clear();
    await Get.delete<MainController>();
    await Get.delete<HomeController>();
    await Get.delete<ProfileController>();
    update();
  }
}
