import 'package:flutter/material.dart';import 'package:flutter_screenutil/flutter_screenutil.dart';class NoNotification extends StatelessWidget {  const NoNotification({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    return Center(      child: Column(        mainAxisAlignment: MainAxisAlignment.center,        crossAxisAlignment: CrossAxisAlignment.center,        children: [          Image.asset(            'assets/images/img.png',            width: 280.w,            height: 280.h,            fit: BoxFit.fill,          ),          SizedBox(            height: 10.h,          ),          Text(           "No Notification",            style: Theme.of(context).textTheme.headline2,          )        ],      ),    );  }}