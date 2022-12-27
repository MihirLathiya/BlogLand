import 'package:get/get.dart';

class BottomBarController extends GetxController {
  var selectMenu = 0;
  updateMenu(int value) {
    selectMenu = value;
    update();
  }
}
