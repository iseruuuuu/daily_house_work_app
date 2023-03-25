import 'package:get/get.dart';

class TabScreenController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final data = <DateTime>[];

  @override
  void onInit() {
    super.onInit();
  }

  void onTap(int index) {
    selectedIndex.value = index;
  }
}
