import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hoyorder/modules/home/views/screens/home.dart';
import 'package:hoyorder/modules/main/views/screens/main_screen.dart';
import 'package:hoyorder/modules/notification/controller/controller.dart';
import 'package:hoyorder/modules/orders/controller/controller.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  var controller = Get.put(OrderController());
  int groupValue = 0;
  @override
  void initState() {
    controller.getOrderDetails();
    super.initState();
  }

  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        shadowColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          "Payment",
          style: Theme.of(context).textTheme.headline3!.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 18.sp),
        ),
      ),
      body: GetBuilder<OrderController>(builder: (logic) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 47.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFF7EB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'To Pay by bank'.tr,
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      const Text("2679902"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Date Information'.tr,
                  style: TextStyle(
                      color: const Color(0xff707070), fontSize: 16.sp),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffE8E8E8),
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Text('Time :'.tr),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(logic.orderDetails.since),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text('Details Order'.tr,
                    style: TextStyle(
                        color: const Color(0xff707070), fontSize: 16.sp)),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xffC6C6C6), width: .5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Status :".tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontWeight: FontWeight.bold),

                            //  style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white,fontSize: 16.sp),
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                          Text(
                            logic.orderDetails.status.name,

                            //  style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white,fontSize: 16.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Quantity :'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                          Text(logic.orderDetails.qty.toString()),
                        ],
                      ),
                      logic.orderDetails.size != ""
                          ? SizedBox(
                              height: 8.h,
                            )
                          : Container(),
                      logic.orderDetails.size != ""
                          ? Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Size :'.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 13.w,
                                  ),
                                  Text(
                                    logic.orderDetails.size,
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Date :',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                          Text(
                            logic.orderDetails.since,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Price :'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                          Text(
                            logic.orderDetails.price.toString(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Tax :'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                          Text(logic.orderDetails.tax),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Shipping Expenses :'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                          Text(logic.orderDetails.shipping),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Total :'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                          Text(logic.orderDetails.total),
                        ],
                      ),
                      logic.orderDetails.notes != ""
                          ? SizedBox(
                              height: 8.h,
                            )
                          : Container(),
                      logic.orderDetails.notes != ""
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Notes :'.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 13.w,
                                ),
                                Text(
                                  logic.orderDetails.notes,
                                ),
                              ],
                            )
                          : Container(),
                      SizedBox(
                        height: 8.h,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text('Please attach the bank transfer logo'.tr,
                    style: TextStyle(
                        color: const Color(0xff707070), fontSize: 16.sp)),
                SizedBox(
                  height: 5.h,
                ),
                if (logic.photo?.path == null)
                  InkWell(
                    onTap: () async {
                      await logic.imgFromGallery();
                    },
                    child: Container(
                      height: 96.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xffE8E8E8))),
                      child: Center(
                        child: DottedBorder(
                            borderType: BorderType.Circle,
                            child: const Icon(
                              Icons.camera_alt,
                              size: 20,
                            )),
                      ),
                    ),
                  )
                else
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xffE8E8E8))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 133.h,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.file(
                                  File(
                                    logic.photo!.path,
                                  ),
                                  fit: BoxFit.fill,
                                  width: 200.w,
                                ),
                                logic.isSend == false
                                    ? InkWell(
                                        onTap: () {
                                          logic.removePhoto();
                                        },
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: CircleAvatar(
                                              radius: 10.w,
                                              backgroundColor: Colors.black,
                                              child: Icon(
                                                Icons.clear_rounded,
                                                size: 15.w,
                                              )),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          logic.isSend == false
                              ? InkWell(
                                  onTap: () async {
                                    print(logic.id);
                                    File file = File(logic.photo!.path);
                                    await logic.takePhoto(logic.id, file);
                                    logic.isSend = true;
                                    Future.delayed(const Duration(minutes: 1),
                                        () {
                                      logic.photo = null;
                                      logic.isSend = false;
                                      setState(() {});
                                    });
                                  },
                                  child: DottedBorder(
                                      borderType: BorderType.Circle,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Image.asset(
                                            'assets/images/Icon color.png'),
                                      )),
                                )
                              : Container(),
                          SizedBox(
                            height: 10.h,
                          ),
                          // logic.isloader == true
                          //     ? CircularProgressIndicator(
                          //         color: Theme.of(context).primaryColor,
                          //       )
                          //     : Container(),
                        ],
                      )),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 48.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (logic.isDone) {
                        Get.snackbar("Done", "Complete Order");
                        Future.delayed(const Duration(seconds: 2), () {
                          Get.offAll(MainScreen());
                        });
                      }
                    },
                    child: const Text("Complete"),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
