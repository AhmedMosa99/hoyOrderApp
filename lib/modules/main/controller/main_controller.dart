import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoyorder/modules/Profile/views/screens/my_profile.dart';
import 'package:hoyorder/modules/home/views/screens/byeType.dart';
import 'package:hoyorder/modules/home/views/screens/home.dart';
import 'package:hoyorder/modules/main/models/category.dart';
import 'package:hoyorder/modules/notification/views/screens/notification_screen.dart';
import 'package:hoyorder/modules/orders/views/screens/order_screen.dart';
import 'package:hoyorder/services/data_fetch.dart';

class MainController extends GetxController {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    ByeOrder(),
    NotificationScreen(),
    MyProfile(),

    //OrderScreen(),
  ];

  List<CategoryModel> allCategories = [];
  changeIndex(int index) {
    currentIndex = index;
    update();
  }

  getCategory() async {
    List<dynamic> categories =
        await DioHandler.apiHelper.getCategoriy(Get.locale.toString());
    allCategories = categories.map((e) => CategoryModel.fromJson(e)).toList();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getCategory();
  }
}
