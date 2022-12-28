import 'package:get/get.dart';

class ProfileController extends GetxController {
  List<String> tabs = ['Top', 'Recent'];
  var selectTab = 0;
  updateTab(int value) {
    selectTab = value;
    update();
  }
}
