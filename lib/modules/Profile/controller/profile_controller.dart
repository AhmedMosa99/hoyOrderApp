import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hoyorder/modules/auth/models/login.dart';
import 'package:hoyorder/services/data_fetch.dart';
import 'package:hoyorder/services/shared_pref.dart';
import 'package:hoyorder/utils/constant.dart';

class ProfileController extends GetxController {
  bool isPassword = true;
  var iconPass = Icons.visibility_off_outlined;
  var passwordControllerOld = TextEditingController();
  var passwordControllerNew = TextEditingController();
  var nameController = TextEditingController();
  var ratingController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var city = TextEditingController();
  var street = TextEditingController();
  var streetNumber = TextEditingController();
  String rateValue = '3';
  changeVisible(bool val) {
    isPassword = val;
    iconPass = isPassword ? Icons.visibility_off_outlined : Icons.visibility;
    update();
  }

  postRate() async {
    final String rate = await DioHandler.apiHelper
        .postRaiting(rateValue, ratingController.text);
    print(rate);
    return rate;
  }

  Rx<String> countryCode = '+972'.obs;
  var keyEdit = GlobalKey<FormState>();
  var keyPass = GlobalKey<FormState>();
  XFile? imagePicked;
  void showPicker(context) async {
    await showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () async {
                      await _imgFromGallery();

                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () async {
                    await _imgFromCamera();

                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  _imgFromCamera() async {
    XFile? image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        maxHeight: 350,
        maxWidth: 550);

    imagePicked = image;
    update();
  }

  _imgFromGallery() async {
    XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 350,
        maxWidth: 550);

    imagePicked = image;
    update();
  }

  uploadImage() async {
    if (imagePicked != null) {
      await changePassAndEditProfile(
        phone: '',
        pastPassword: '',
        newPassword: '',
        email: '',
        image: imagePicked!.path,
        name: '',
        city: '',
        street: '',
        streetNumber: '',
      );
    }
  }

  changePassAndEditProfile({
    required String phone,
    required String pastPassword,
    required String newPassword,
    required String email,
    required String image,
    required String name,
    required String city,
    required String street,
    required String streetNumber,
  }) async {
    try {
      final data = await DioHandler.apiHelper.changePasswordAndEditProfile(
        name: name,
        phone: phone,
        image: image,
        pastPass: pastPassword,
        newPass: newPassword,
        city: city,
        street: street,
        streetNumber: streetNumber,
      );
      await SharePref.setData(key: 'userInfo', data: json.encode(data));
      final val = await SharePref.getData(key: 'userInfo');
      userInfo = LoginModel.fromJson(json.decode(val));

      update();
    } catch (e) {
      throw Exception();
    }
  }
}
