import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/widgets/template/map.template.dart';
import 'package:get/get.dart';

import '../../controllers/map.controller.dart';

class MapPage extends StatelessWidget {
  final MapController mapController = Get.find();

  MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: MapTemplate()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mapController.updateMarkers();
        },
      ),
    );
  }
}
