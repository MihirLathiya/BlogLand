import 'package:get/get.dart';

class PasswordController extends GetxController {
  var isShow = true.obs;

  updateValue() {
    isShow.value = !isShow.value;
  }
}
