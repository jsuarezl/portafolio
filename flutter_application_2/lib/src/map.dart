// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MapPage extends Statele {
  static String id = 'map_page';
  late PolylinePoints polylinePoints;

  MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // Definir el centro del mapa
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-33.4324607, -70.6178351);
  final LatLng _point2 = const LatLng(-33.43281435138516, -70.6114728696149);
  final Set<Polyline> _polylines = Set<Polyline>();
  final List<LatLng> polylineCoordinates = [];

  final CameraPosition _pos2 = CameraPosition(
    target: LatLng(-33.43281435138516, -70.6114728696149),
    zoom: 15,
  );

  @override
  void initState() {
    widget.polylinePoints = PolylinePoints();
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 17.0,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('Punto1'),
              position: _center,
              infoWindow: InfoWindow(
                title: "Sydney",
                snippet: "Capital of New South Wales",
              ),
            ),
            Marker(
              markerId: const MarkerId('Punto2'),
              position: _point2,
              infoWindow: InfoWindow(
                title: "Sydney",
                snippet: "Capital of New South Wales",
              ),
            ),
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToTheLake,
          label: const Text('To the lake!'),
          icon: const Icon(Icons.directions_boat),
        ),
      ),
    );
  }

  void _goToTheLake() {
    mapController.animateCamera(CameraUpdate.newCameraPosition(_pos2));
  }
}
