import 'package:flutter_application_2/src/widgets/page/map.page.dart';
import 'package:get/get.dart';

List<GetPage> getPages() {
  return [
    GetPage(name: '/', page: () => MapPage()),
  ];
}
