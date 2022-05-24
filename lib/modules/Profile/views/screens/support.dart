import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hoyorder/utils/constant.dart';
import 'package:hoyorder/utils/shared/shared_widget_style.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Support Center".tr,
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ShareWidgetStyle(
            whatsPressed: () async {
              const number = '+9710506338367‬';
              const url = "https://wa.me/$number?text=Hello";
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                Get.snackbar('Error', 'Can not launch');
              }
            },
            emailPressed: () async {
              const url = "houda.mosa.2020@gmail.com";
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                Get.snackbar('Error', 'Can not launch');
              }
            },
            callPressed: () async {
              const tell = "tel: 9710506338367";
              if (await canLaunch(tell)) {
                await launch(tell);
              } else {
                Get.snackbar('Error', 'Can not launch');
              }
            },
            img: 'assets/images/Icon support color.svg',
            isSocial: true,
            title: "Hoy Order".tr,
            desc:
                'If you have problems using the site, please contact us through our accounts'
                    .tr,
          ),
        ),
      ),
    );
  }
}
