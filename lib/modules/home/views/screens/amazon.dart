import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:hoyorder/modules/home/controller/home_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Amazon extends StatefulWidget {
  late String url;
  late String name;
  Amazon({
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  State<Amazon> createState() => _AmazonState();
}

class _AmazonState extends State<Amazon> {
  late WebViewController controllerview;
  final controller = Get.put(HomeController(), permanent: true);
  late DateTime currentBackPressTime;
  bool exit=false;

  @override
  void initState() {

    super.initState();

  }



  Future<bool> _exitApp(BuildContext context) async {
    if (await controllerview.canGoBack()) {
     await controllerview.goBack();
     return Future.value(false);
    } else {
      Scaffold.of(context).showSnackBar(
        const SnackBar(content: Text("No back history item")),
      );
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (logic) {
        return WillPopScope(
            onWillPop: () async{
              if(await controllerview.canGoBack()){
                controllerview.goBack();
                return false;
              }
              else{ 
                showDialog(context: context, builder: (context)=> AlertDialog(
                  title:  Text("Do you really want to exit the app",style: TextStyle(fontSize: 16.sp),textAlign: TextAlign.center,),
                  actions: [
                    ElevatedButton(onPressed: (){
                      SystemNavigator.pop();

                    }, child: const Text('Yes')),
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context,false);
                    }, child: const Text('No')),
                  ],
                ));
                return Future.value(true);
              }

            },

          child: WebView(
            onWebViewCreated: (controller) {
              controllerview = controller;
            },
            onPageStarted: (url) {
              controllerview.currentUrl().then((value) {
                controller.page = value.toString();
              });
            },
            onProgress: (progress) {
              controllerview.currentUrl().then((value) {

                controller.page = value.toString();
              });

            },
            onWebResourceError:(v){
           if(v.description=='net::ERR_NAME_NOT_RESOLVED'){
             Get.defaultDialog( title: 'Sorry',content: const Text('No internet available'));

           }
            },
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        );
      },
    );
  }
}
