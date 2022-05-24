import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hoyorder/modules/notification/models/notification_model.dart';
import 'package:hoyorder/services/data_fetch.dart';
import 'package:hoyorder/utils/constant.dart';

class NotificationController extends GetxController {
  List<Notifications> allNotifications = [];
  XFile? photo;
  late int id;
  bool isDone = false;
  late Notifications orderDetails;

  late bool isSend = false;
  late bool isloader = false;
  @override
  void onInit() {
    if (userInfo != null) {
      getNoification();
      super.onInit();
    }
  }

  getDetails() async {
    dynamic respone = await DioHandler.apiHelper.fetchDetailsOrder(id);
    orderDetails = Notifications.fromJson(respone);
    update();
  }

  imgFromGallery() async {
    ImagePicker picker = ImagePicker();
    photo = await picker.pickImage(source: ImageSource.gallery);

    update();
  }

  takePhoto(int id, File file) async {
    isloader = true;
    update();
    var response =
        await DioHandler.apiHelper.takePhoto(id, file, Get.locale.toString());
    isSend = response;
    if (response) {
      Get.snackbar('Great'.tr, 'send done'.tr,
          colorText: Colors.green, duration: const Duration(seconds: 3));
      isloader = false;
      isDone = true;
      update();
    } else {
      Get.snackbar('Sorry'.tr, 'Try again'.tr);
      isloader = false;
      photo = null;
      update();
    }
    isSend = false;

    update();
  }

  cancelOrder(
    int orderId,
  ) async {
    var response =
        await DioHandler.apiHelper.cancel(orderId, Get.locale.toString());

    if (response) {
      Get.snackbar('Done'.tr, 'Cancel Order'.tr,
          colorText: Colors.green, duration: const Duration(seconds: 3));
    } else {
      Get.snackbar('Sorry'.tr, 'Try again'.tr);
    }
    update();
  }

  removePhoto() {
    photo = null;
    update();
  }

  getNoification() async {
    List<dynamic> notifications =
        await DioHandler.apiHelper.getNotifications(Get.locale.toString());
    allNotifications =
        notifications.map((e) => Notifications.fromJson(e)).toList();
    update();
  }
}
