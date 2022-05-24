// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  bool? isCenter;
  IconData? icon;
  IconData? iconBack;
  Function()? iconFunction;

  CustomAppBar(
      {Key? key,
      this.title,
      this.icon,
      this.isCenter,
      this.iconFunction,
      this.iconBack})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight((44.0).h);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff469F8B),
      centerTitle: isCenter!,
      title: Text(
        title!,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.white),
      ),
      systemOverlayStyle: Theme.of(context)
          .appBarTheme
          .systemOverlayStyle!
          .copyWith(statusBarColor: const Color(0xff469F8B)),
      leading: IconButton(
        icon: Icon(iconBack),
        color: Colors.white,
        onPressed: () {
          Get.back();
        },
      ),
      actions: [
        IconButton(
            icon: Icon(icon), color: Colors.white, onPressed: iconFunction),
      ],
    );
  }
}

Widget defaultFormField(
        {TextEditingController? controller,
        required TextInputType? type,
        void Function(String? s)? onSubmit,
        void Function(String? s)? onChange,
        void Function()? onTap,
        bool isPassword = false,
        String? Function(String? s)? validate,
        String? label,
        Widget? prefix,
        Widget? suffix,
        void Function()? suffixPressed,
        bool isClickable = true,
        double focusBorderRadius = 12,
        double labelFontSize = 14,
        Color focusColor = Colors.grey,
        Key? key,
        Color? fillColor,
        Color? labelColor = const Color(0xff707070),
        void Function(String?)? onSaved,
        Color borderColor = Colors.grey,
        double borderRadius = 12,
        Color? writeTxtStyle,
        FocusNode? focusNode,
        void Function()? onEditingComplete,
        TextInputAction? textInputAction,
        void Function()? prefixPressed,
        bool isSuffixWidget = false,
        TextAlign textAlign = TextAlign.start,
        double? cursorHeight,
        String? prefixText,
        TextStyle? hintStyle,
        int? line = 1,
        String? hintText}) =>
    TextFormField(
      maxLines: line,
      textAlignVertical: TextAlignVertical.center,
      cursorHeight: cursorHeight,
      textInputAction: textInputAction,
      focusNode: focusNode,
      style: TextStyle(color: writeTxtStyle, fontSize: 14),
      key: key,
      onEditingComplete: onEditingComplete,
      onSaved: onSaved,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      textAlign: textAlign,
      decoration: InputDecoration(
        errorMaxLines: 1, errorStyle: const TextStyle(height: .6, fontSize: 10),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        alignLabelWithHint: false,
        contentPadding: EdgeInsets.all(8.r),
        prefixText: prefixText,
        filled: fillColor == null ? false : true,
        fillColor: fillColor,
        hintText: hintText,

        hintStyle: hintStyle,
        // helperText: hintText, //go hiny up to field
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusColor),
            borderRadius: BorderRadius.circular(focusBorderRadius)),
        labelText: label,
        labelStyle: TextStyle(fontSize: labelFontSize, color: labelColor),
        prefixIcon: prefix != null
            ? InkWell(onTap: prefixPressed, child: prefix)
            : null,
        suffixIcon: isSuffixWidget
            ? suffix
            : suffix != null
                ? IconButton(
                    onPressed: suffixPressed,
                    icon: suffix,
                  )
                : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(focusBorderRadius))),
      ),
    );
