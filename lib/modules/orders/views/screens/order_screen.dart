// ignore_for_file: must_be_immutable

import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:hoyorder/modules/orders/controller/controller.dart';
import 'package:hoyorder/modules/orders/views/widgets/no_order.dart';
import 'package:hoyorder/modules/orders/views/widgets/order_widget.dart';
import 'package:hoyorder/utils/constant.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var controller = Get.put(OrderController());
  late DateTime currentBackPressTime;

  @override
  void initState() {
    if (userInfo != null) {
      controller.getOrder();
    }

    super.initState();
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
          "Orders ",
          style: Theme.of(context).textTheme.headline3!.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 18.sp),
        ),
      ),
      body: GetBuilder<OrderController>(
          init: OrderController(),
          builder: (logic) {
            return logic.allorders.isEmpty ? const NoOrder() : OrderWidget();
          }),
    );
  }
}
