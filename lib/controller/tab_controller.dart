import 'package:get/get.dart';

class TabControllers extends GetxController {
  List<String> tabs = ['LOGIN', 'SIGNUP'];
  var selectTab = 0;
  updateTab(int value) {
    selectTab = value;
    update();
  }
}
