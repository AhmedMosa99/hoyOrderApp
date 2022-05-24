// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ShareWidgetStyle extends StatelessWidget {
  final String img, title, desc;
  bool isSocial = true;
  bool isHttp;
  void Function()? whatsPressed;
  void Function()? emailPressed;
  void Function()? callPressed;

  ShareWidgetStyle(
      {Key? key,
      required this.img,
      required this.title,
      this.desc = '',
      required this.isSocial,
      this.isHttp = false,
      this.emailPressed,
      this.whatsPressed,
      this.callPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xffE5F2F2),
            radius: 55,
            child: isHttp
                ? SvgPicture.network(img)
                : SvgPicture.asset(
                    // 'assets/images/paint-brush.svg' ,
                    img,
                    width: 43,
                    height: 43,
                    fit: BoxFit.fill),
          ),
          SizedBox(
            height: 18.h,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          SizedBox(
            height: 6.h,
          ),
          isSocial
              ? Column(
                  children: [
                    Text(
                      desc,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    TextButton.icon(
                        onPressed: whatsPressed,
                        icon: SvgPicture.asset(
                            'assets/images/whatsapp_outlined.svg'),
                        label: Text(
                          'Contact via WhatsApp'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 14.h,
                    ),
                    TextButton.icon(
                        onPressed: emailPressed,
                        icon: SvgPicture.asset('assets/images/email.svg'),
                        label: Text(
                          'Contact via email'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 14.h,
                    ),
                    TextButton.icon(
                        onPressed: callPressed,
                        icon: const Icon(
                          Icons.phone_iphone_rounded,
                          color: Color(0xff009196),
                          size: 20,
                        ),
                        label: Text(
                          'Contact via Call'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                        )),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
