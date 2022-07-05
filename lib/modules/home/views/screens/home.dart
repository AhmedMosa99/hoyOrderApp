// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hoyorder/modules/auth/views/screen/login.dart';
import 'package:hoyorder/modules/home/controller/home_controller.dart';
import 'package:hoyorder/modules/home/views/screens/amazon.dart';
import 'package:hoyorder/modules/main/controller/main_controller.dart';
import 'package:hoyorder/utils/component/component.dart';
import 'package:hoyorder/utils/constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MainController controller = Get.put(MainController());
  final controller1 = Get.put(HomeController());

  @override
  void initState() {
    controller1.getPrice();
    super.initState();
    controller.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (logic) {
      return DefaultTabController(
        length: logic.allCategories.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            // toolbarHeight: 50.h,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TabBar(
                  padding: EdgeInsets.only(top: 10.h),
                  isScrollable: true,
                  indicator: const BoxDecoration(color: Color(0xfffebd69)),
                  tabs: logic.allCategories
                      .map((e) => Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Text(
                              e.name,
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.white),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: logic.allCategories
                    .map((e) => Amazon(
                          url: e.link,
                        ))
                    .toList(),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller1.price,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  color: Theme.of(context).primaryColor,
                  height: 55.h,
                  width: double.infinity,
                ),
              ),
              GetBuilder<HomeController>(
                init: HomeController(),
                builder: (logic) {
                  return Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                              bottomLeft: Radius.zero,
                              bottomRight: Radius.zero,
                            )),
                          ),
                          onPressed: () {
                            if (userInfo == null) {
                              Get.offAll(() => LoginScreen());
                            } else {
                              Get.bottomSheet(
                                StatefulBuilder(builder: (context, setState) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Enter Details'.tr,
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                CircleAvatar(
                                                    backgroundColor:
                                                        Theme.of(context)
                                                            .primaryColor,
                                                    child: IconButton(
                                                      icon: const Icon(
                                                          Icons.close),
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                    )),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Text('Enter Color'.tr),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            defaultFormField(
                                              type: TextInputType.text,
                                              controller: logic.color,
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Text('Enter Size  (optional)'.tr),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            defaultFormField(
                                              type: TextInputType.text,
                                              controller: logic.size,
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Text('Quantity'.tr),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Container(
                                              height: 44.h,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffC6C6C6),
                                                      width: .5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      padding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              horizontal: 10),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: const Color(
                                                                  0xffC6C6C6),
                                                              width: .5),
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .only(
                                                                  topRight:
                                                                      Radius.circular(
                                                                          12),
                                                                  bottomRight:
                                                                      Radius.circular(
                                                                          12))),
                                                      child: IconButton(
                                                          icon: const Icon(
                                                              Icons.remove),
                                                          onPressed: () async {
                                                            if (logic
                                                                    .counterOrder >
                                                                1) {
                                                              await logic
                                                                  .minusPackageCounter();
                                                              setState(() {});
                                                            }
                                                          })),
                                                  Text(
                                                    logic.counterOrder
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline2,
                                                  ),
                                                  Container(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: const Color(
                                                                  0xffC6C6C6),
                                                              width: .5),
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          12),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          12))),
                                                      child: IconButton(
                                                          icon: const Icon(Icons.add),
                                                          onPressed: () async {
                                                            await logic
                                                                .addPackageCounter();
                                                            setState(() {});
                                                          })),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    logic.postOrder(
                                                        logic.page,
                                                        logic.counterOrder
                                                            .toString(),
                                                        logic.color.text,
                                                        logic.size.text);
                                                    // Get.back();
                                                  },
                                                  child: Text('Confim'.tr)),
                                            )
                                          ]),
                                    ),
                                  );
                                }),
                                backgroundColor: Colors.white,
                              );
                            }
                          },
                          child: Text('Hoy Order'.tr),
                        ),
                      ));
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
