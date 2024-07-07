import 'package:get/get.dart';
import 'package:wynk_clone/data/repositories/authenticatio_repository.dart';
import 'package:wynk_clone/initial_page/language_selection/ui/language_select.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(LanguageSelection()) : Get.back();
  }
}
