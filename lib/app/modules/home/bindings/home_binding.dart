import 'package:flutter_getx_tdd/app/data/services/news_service.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(NewsService()),
    );
  }
}
