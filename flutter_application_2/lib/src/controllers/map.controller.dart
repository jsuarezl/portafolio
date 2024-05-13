import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  final List<LatLng> locations = [
    const LatLng(-33.4324607, -70.6178351),
    const LatLng(-33.43281435138516, -70.6114728696149)
  ];

  Set<Marker> markers = {};
  late Set<Polyline> result;

  late GoogleMapController mapController;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void updateMarkers() {
    if (markers.isEmpty) {
      markers = {
        Marker(
          markerId: const MarkerId('Punto1'),
          position: locations[0],
          infoWindow: const InfoWindow(
            title: "P1",
            snippet: "TEST 1",
          ),
        ),
        Marker(
          markerId: const MarkerId('Punto2'),
          position: locations[1],
          infoWindow: const InfoWindow(
            title: "P2",
            snippet: "TEST 2",
          ),
        )
      };
    } else {
      markers = {};
    }
    update();
  }
}
