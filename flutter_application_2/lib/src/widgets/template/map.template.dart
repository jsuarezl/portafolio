import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import '../../controllers/map.controller.dart';

class MapTemplate extends StatelessWidget {
  const MapTemplate({super.key});

  static const List<LatLng> points = [
    LatLng(-33.44506735118542, -70.64628945681663),
    LatLng(-33.43661597080002, -70.64768420543484),
    LatLng(-33.43692037802916, -70.63598977471295),
    LatLng(-33.44194805059744, -70.63029295219013)
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapController>(
        builder: (mapController) => GoogleMap(
              zoomControlsEnabled: false,
              style:
                  '[{"elementType":"geometry","stylers":[{"color":"#f5f5f5"}]},{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#616161"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#f5f5f5"}]},{"featureType":"administrative.land_parcel","elementType":"labels.text.fill","stylers":[{"color":"#bdbdbd"}]},{"featureType":"poi","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"poi.park","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#ffffff"}]},{"featureType":"road.arterial","elementType":"labels.text.fill","stylers":[{"color":"#757575"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#dadada"}]},{"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#616161"}]},{"featureType":"road.local","elementType":"labels.text.fill","stylers":[{"color":"#9e9e9e"}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#e5e5e5"}]},{"featureType":"transit.station","elementType":"geometry","stylers":[{"color":"#eeeeee"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#c9c9c9"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#9e9e9e"}]}]',
              onMapCreated: mapController.onMapCreated,
              initialCameraPosition: CameraPosition(
                target: mapController.locations[0],
                zoom: 15.0,
              ),
              markers: mapController.markers,
              polylines: {
                Polyline(
                  polylineId: const PolylineId('direction_poly'),
                  points: PolylinePoints()
                      .decodePolyline(
                          'nsckEvzdnLuEt@wKhBu@ToCf@UFCOQoAq@qDc@wBYsAFaAD]Pg@\\gBXwAHQJi@`@kCP{Ab@cFBq@?yAIiAS}AwDcR}@uEcAaF]yAUaBOsAiBgOwBsQ}B_Qm@sFD_E_BcMy@qGk@mGWyBm@yEmCn@wInBaEdAqCyVKa@IUIImF~@_BZ`CrT')
                      .map((e) => LatLng(e.latitude, e.longitude))
                      .toList(),
                  width: 5,
                  color: Colors.green.withOpacity(.8),
                )
              },
              polygons: {
                Polygon(
                  polygonId: PolygonId('1'),
                  points: points,
                  geodesic: true,
                  fillColor: Colors.red.withOpacity(.3),
                  strokeWidth: 3,
                  strokeColor: Colors.red,
                )
              },
            ));
  }
}
