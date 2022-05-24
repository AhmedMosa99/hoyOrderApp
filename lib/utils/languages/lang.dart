import 'package:get/get.dart';
import 'package:hoyorder/utils/languages/arabic.dart';
import 'package:hoyorder/utils/languages/english.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {'en_US': getEnglish(), 'ar_SA': getArabic()};
}
