import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wynk_clone/data/repositories/authenticatio_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final phoneNo = TextEditingController();

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
