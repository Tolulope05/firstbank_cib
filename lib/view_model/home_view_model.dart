import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final count = 0.obs;

  void increment() {
    count.value++;
  }
}
