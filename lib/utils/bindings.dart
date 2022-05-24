import 'package:get/get.dart';
import 'package:hoyorder/modules/auth/controller/auth.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
