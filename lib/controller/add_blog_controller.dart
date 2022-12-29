import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBlogController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  TextEditingController tagsController = TextEditingController();
  TextEditingController blogTextController = TextEditingController();
  List<String> blogTag = ['Health', 'World', 'Income', 'Politics', 'Other'];
  String selectTag = '';
  List<String> tags = [];

  addTage({String? value}) {
    tags.add(value!);
    log('ADDED TAGS :- ${tags.length}==> ${tags}');

    update();
  }

  removeTage({String? value}) {
    tags.remove(value!);
    log('ADDED TAGS :- ${tags.length}==> ${tags}');
    tagsController.clear();

    update();
  }

  updateTag(String value) {
    selectTag = value;
    update();
  }
}
