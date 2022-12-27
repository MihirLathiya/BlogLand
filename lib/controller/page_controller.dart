import 'package:get/get.dart';

class PageControllers extends GetxController {
  var selectPage = 0;
  updatePage(int value) {
    selectPage = value;
    update();
  }
}
