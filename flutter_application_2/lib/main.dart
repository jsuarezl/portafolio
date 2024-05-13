import 'package:flutter/material.dart';
import 'package:flutter_application_2/routes.dart';
import 'package:flutter_application_2/src/controllers/map.controller.dart';
import 'package:get/get.dart';

void main() {
  Get.put(MapController());

  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: getPages(),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      title: 'ODR',
      enableLog: true,
      theme: ThemeData.dark(useMaterial3: true),
    );
  }
}
