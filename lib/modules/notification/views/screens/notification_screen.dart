// ignore_for_file: implementation_imports

import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hoyorder/modules/notification/controller/controller.dart';
import 'package:hoyorder/modules/notification/views/screens/payment.dart';
import 'package:hoyorder/modules/notification/views/widgets/no_notification.dart';
import 'package:hoyorder/modules/orders/views/screens/order_screen.dart';
import 'package:hoyorder/utils/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  var controller = Get.put(NotificationController());
  @override
  void initState() {
    // TODO: implement initState

    if (userInfo != null) {
      controller.getNoification();
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        shadowColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Notifications",
          style: Theme.of(context).textTheme.headline3!.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 18.sp),
        ),
      ),
      body: DoubleBack(
          message: "Press back again to close",
          child: GetBuilder<NotificationController>(builder: (logic) {
            return logic.allNotifications.isEmpty
                ? const NoNotification()
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (c, i) => InkWell(
                                onTap: () {
                                  Get.to(OrderScreen());
                                  // Get.defaultDialog(
                                  //     contentPadding: EdgeInsets.all(16.h),
                                  //     titlePadding: EdgeInsets.only(top: 15.h),
                                  //     title: "OrderDetails",
                                  //     titleStyle: TextStyle(fontSize: 18.sp),
                                  //     content: Column(
                                  //       children: [
                                  //         Row(
                                  //           children: [
                                  //             Text('Quantity:',
                                  //                 style: TextStyle(
                                  //                     fontSize: 16.sp,
                                  //                     fontWeight:
                                  //                         FontWeight.bold)),
                                  //             SizedBox(
                                  //               width: 10.w,
                                  //             ),
                                  //             Text(logic.allNotifications[i].qty
                                  //                 .toString()),
                                  //           ],
                                  //         ),
                                  //         SizedBox(
                                  //           height: 15.h,
                                  //         ),
                                  //         logic.allNotifications[i].color != ""
                                  //             ? Row(
                                  //                 children: [
                                  //                   Text('Color:',
                                  //                       style: TextStyle(
                                  //                           fontSize: 16.sp,
                                  //                           fontWeight:
                                  //                               FontWeight
                                  //                                   .bold)),
                                  //                   SizedBox(
                                  //                     width: 10.w,
                                  //                   ),
                                  //                   Text(logic
                                  //                       .allNotifications[i]
                                  //                       .color),
                                  //                 ],
                                  //               )
                                  //             : Container(),
                                  //         logic.allNotifications[i].color != ""
                                  //             ? SizedBox(
                                  //                 height: 15.h,
                                  //               )
                                  //             : Container(),
                                  //         logic.allNotifications[i].size != ""
                                  //             ? Row(
                                  //                 children: [
                                  //                   Text('Size:',
                                  //                       style: TextStyle(
                                  //                           fontSize: 16.sp,
                                  //                           fontWeight:
                                  //                               FontWeight
                                  //                                   .bold)),
                                  //                   SizedBox(
                                  //                     width: 10.w,
                                  //                   ),
                                  //                   Text(logic
                                  //                       .allNotifications[i]
                                  //                       .size),
                                  //                 ],
                                  //               )
                                  //             : Container(),
                                  //         logic.allNotifications[i].size != ""
                                  //             ? SizedBox(
                                  //                 height: 15.h,
                                  //               )
                                  //             : Container(),
                                  //         Row(
                                  //           children: [
                                  //             Text(
                                  //               'Product Price:',
                                  //               style: TextStyle(
                                  //                   fontSize: 16.sp,
                                  //                   fontWeight:
                                  //                       FontWeight.bold),
                                  //             ),
                                  //             SizedBox(
                                  //               width: 10.w,
                                  //             ),
                                  //             Text(logic
                                  //                 .allNotifications[i].price
                                  //                 .toString()),
                                  //           ],
                                  //         ),
                                  //         SizedBox(
                                  //           height: 15.h,
                                  //         ),
                                  //         Row(
                                  //           children: [
                                  //             Text(
                                  //               'Our Services:',
                                  //               style: TextStyle(
                                  //                   fontSize: 16.sp,
                                  //                   fontWeight:
                                  //                       FontWeight.bold),
                                  //             ),
                                  //             SizedBox(
                                  //               width: 10.w,
                                  //             ),
                                  //             Text(logic
                                  //                 .allNotifications[i].tax),
                                  //           ],
                                  //         ),
                                  //         SizedBox(
                                  //           height: 15.h,
                                  //         ),
                                  //         Row(
                                  //           children: [
                                  //             Text('Shipping Cost:',
                                  //                 style: TextStyle(
                                  //                     fontSize: 16.sp,
                                  //                     fontWeight:
                                  //                         FontWeight.bold)),
                                  //             SizedBox(
                                  //               width: 10.w,
                                  //             ),
                                  //             Text(logic.allNotifications[i]
                                  //                 .shipping),
                                  //           ],
                                  //         ),
                                  //         SizedBox(
                                  //           height: 15.h,
                                  //         ),
                                  //         Row(
                                  //           children: [
                                  //             Text('Estimated Delivery time:',
                                  //                 style: TextStyle(
                                  //                     fontSize: 16.sp,
                                  //                     fontWeight:
                                  //                         FontWeight.bold)),
                                  //             SizedBox(
                                  //               width: 10.w,
                                  //             ),
                                  //             Text(logic.allNotifications[i]
                                  //                 .deliveryTime),
                                  //           ],
                                  //         ),
                                  //         SizedBox(
                                  //           height: 15.h,
                                  //         ),
                                  //         Row(
                                  //           children: [
                                  //             Text('Total:',
                                  //                 style: TextStyle(
                                  //                     fontSize: 16.sp,
                                  //                     fontWeight:
                                  //                         FontWeight.bold)),
                                  //             SizedBox(
                                  //               width: 10.w,
                                  //             ),
                                  //             Text(logic
                                  //                 .allNotifications[i].total),
                                  //           ],
                                  //         ),
                                  //         SizedBox(
                                  //           height: 15.h,
                                  //         ),
                                  //         logic.allNotifications[i].notes != ""
                                  //             ? Row(
                                  //                 children: [
                                  //                   Text('Duration Offer:',
                                  //                       style: TextStyle(
                                  //                           fontSize: 16.sp,
                                  //                           fontWeight:
                                  //                               FontWeight
                                  //                                   .bold)),
                                  //                   SizedBox(
                                  //                     width: 10.w,
                                  //                   ),
                                  //                   Expanded(
                                  //                       child: Text(logic
                                  //                           .allNotifications[i]
                                  //                           .timeOffer)),
                                  //                 ],
                                  //               )
                                  //             : Container(),
                                  //         SizedBox(
                                  //           height: 15.h,
                                  //         ),
                                  //         logic.allNotifications[i].notes != ""
                                  //             ? Row(
                                  //                 children: [
                                  //                   Text('Order Review:',
                                  //                       style: TextStyle(
                                  //                           fontSize: 16.sp,
                                  //                           fontWeight:
                                  //                               FontWeight
                                  //                                   .bold)),
                                  //                   SizedBox(
                                  //                     width: 10.w,
                                  //                   ),
                                  //                   Expanded(
                                  //                       child: Text(logic
                                  //                           .allNotifications[i]
                                  //                           .notes)),
                                  //                 ],
                                  //               )
                                  //             : Container(),
                                  //       ],
                                  //     ));
                                  //
                                  Get.put(OrderScreen());
                                },
                                child: buildContainerNotification(
                                    url: logic.allNotifications[i].link,
                                    context: context,
                                    time: logic.allNotifications[i].since,
                                    title:
                                        logic.allNotifications[i].status.name,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(.17))),
                            itemCount: logic.allNotifications.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 16.h,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
          })),
    );
  }

  Container buildContainerNotification(
      {required BuildContext context,
      Color? color,
      String? url,
      required String title,
      required String time}) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.notifications_active,
                  size: 24.w,
                  color: const Color(0xff009196),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                  width: 30.w,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.link),
                    onPressed: () async {
                      if (await canLaunch(url.toString())) {
                        await launch(url.toString());
                      } else {
                        Get.snackbar('Error', 'Can not launch');
                      }
                    },
                  ),
                ),
              ],
            ),

            Text(
              time,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            //  IconButton(onPressed: (){}, icon: Icon(Icons.share)),
          ],
        ),
      ),
    );
  }
}
