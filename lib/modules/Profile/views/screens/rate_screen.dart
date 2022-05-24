import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hoyorder/modules/Profile/controller/profile_controller.dart';
import 'package:hoyorder/utils/component/component.dart';
import 'package:hoyorder/utils/constant.dart';

class RateScreen extends StatelessWidget {
  const RateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Store Rating".tr,
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GetBuilder<ProfileController>(builder: (logic) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  userInfo!.name,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18.sp,
                      ),
                )),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  'We want to thank you for using a site that came from you because it helps us always stand out'
                      .tr,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 28.h,
                ),
                Text('rate us'.tr,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18.sp,
                        )),
                SizedBox(
                  height: 8.h,
                ),
                Column(
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        logic.rateValue = rating.toString();
                      },
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    Text(
                      'Leave a comment here'.tr,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    defaultFormField(
                        line: 7,
                        type: TextInputType.text,
                        controller: logic.ratingController),
                    SizedBox(
                      height: 28.h,
                    ),
                    SizedBox(
                      height: 44.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text("Send".tr),
                        onPressed: () async {
                          final val = await logic.postRate();
                          Get.snackbar('Result', val,
                              duration: const Duration(seconds: 1));
                          await Future.delayed(const Duration(seconds: 1));

                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
