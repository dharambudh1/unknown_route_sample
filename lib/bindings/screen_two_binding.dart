import "package:get/get.dart";
import "package:unknown_route_sample/controllers/screen_two_controller.dart";

class ScreenTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenTwoController>(ScreenTwoController.new);
  }
}
