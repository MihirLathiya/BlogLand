import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var selectBlog = 0;
  updateSelectBlog(int value) {
    selectBlog = value;
    update();
  }
}
