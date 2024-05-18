import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  final List<LatLng> locations = [
    const LatLng(-33.44717904737609, -70.64542083490814),
    const LatLng(-33.43291721249615, -70.61496167006258)
  ];

  Set<Marker> markers = {};

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
