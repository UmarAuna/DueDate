
import 'package:due_date_new/screens/home/home_page_controller.dart';
import 'package:get/get.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<HomePageController>(HomePageController());
  }
}
