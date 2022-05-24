import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hoyorder/modules/notification/controller/controller.dart';
import 'package:hoyorder/modules/notification/views/screens/payment.dart';
import 'package:hoyorder/modules/orders/controller/controller.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (logic) {
      return ListView.builder(
        itemCount: logic.allorders.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                        color: HexColor(
                            "#" + "${logic.allorders[index].status.color}")),
                    width: 200.w,
                    height: 48.h,
                    child: Center(
                        child: Text(
                      logic.allorders[index].status.name,
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text("Quantity :".tr,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(logic.allorders[index].qty.toString()),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  logic.allorders[index].color != ""
                      ? Row(
                          children: [
                            Text('Color:'.tr,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(logic.allorders[index].color),
                          ],
                        )
                      : Container(),
                  logic.allorders[index].color != ""
                      ? SizedBox(
                          height: 10.h,
                        )
                      : Container(),
                  logic.allorders[index].size != ""
                      ? Row(
                          children: [
                            Text("Size :".tr,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(logic.allorders[index].size),
                          ],
                        )
                      : Container(),
                  logic.allorders[index].size != ""
                      ? SizedBox(
                          height: 10.h,
                        )
                      : Container(),
                  Row(
                    children: [
                      Text(
                        'Product Price:'.tr,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(logic.allorders[index].price.toString()),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Tax :'.tr,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(logic.allorders[index].tax),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text('Shipping Expenses :'.tr,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(logic.allorders[index].shipping),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text('Total :'.tr,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(logic.allorders[index].total),
                    ],
                  ),
                  logic.allorders[index].notes != ""
                      ? SizedBox(
                          height: 10.h,
                        )
                      : Container(),
                  logic.allorders[index].notes != ""
                      ? Row(
                          children: [
                            Text("Duration Offer :".tr,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                                child: Text(logic.allorders[index].timeOffer)),
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: 10.h,
                  ),
                  logic.allorders[index].notes != ""
                      ? Row(
                          children: [
                            Text('Order Review :'.tr,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(child: Text(logic.allorders[index].notes)),
                          ],
                        )
                      : Container(),
                  logic.allorders[index].status.name == "الدفع او الالغاء" ||
                          logic.allorders[index].status.name ==
                              "Waiting for pay/cancel"
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () async {
                                    logic.id = logic.allorders[index].id;
                                    print(logic.id);
                                    await logic.getOrderDetails();
                                    Get.back();
                                    await Get.to(Payment());
                                  },
                                  child: Text("Pay Order".tr)),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                  ),
                                  onPressed: () async {
                                    await logic
                                        .cancelOrder(logic.allorders[index].id);
                                    Get.back();
                                  },
                                  child: Text("Cancel Order".tr)),
                            ),
                          ],
                        )
                      : Container(),
                  //
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              //,
            ),
          );
        },
      );
    });
  }
}
