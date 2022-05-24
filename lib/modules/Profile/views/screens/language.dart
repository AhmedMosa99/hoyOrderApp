// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late bool isArabic;
  @override
  void initState() {
    Get.locale.toString() == "ar" ? isArabic = true : isArabic = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        title: Text(
          'Languge'.tr,
          style: TextStyle(fontSize: 16.sp, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isArabic = true;
                  Get.updateLocale(Locale('ar'));
                  print(Get.locale.toString());
                });
              },
              child: Row(
                children: [
                  Text(
                    'العربية',
                    style: !isArabic
                        ? Theme.of(context).textTheme.bodyText2
                        : Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: const Color(0xff009196)),
                  ),
                  const Spacer(),
                  if (isArabic)
                    const Icon(
                      Icons.check,
                      size: 22,
                      color: Color(0xff009196),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            const Divider(),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isArabic = false;
                  Get.updateLocale(Locale('en'));
                  print(Get.locale.toString());
                });
              },
              child: Row(
                children: [
                  Text(
                    'English',
                    style: isArabic
                        ? Theme.of(context).textTheme.bodyText2
                        : Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: const Color(0xff009196),
                            ),
                  ),
                  const Spacer(),
                  if (!isArabic)
                    const Icon(
                      Icons.check,
                      size: 22,
                      color: Color(0xff009196),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
