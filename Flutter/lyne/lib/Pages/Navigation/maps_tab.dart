import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsTabWidget extends StatelessWidget {

  // Maps
  GoogleMapController mapController;
  LatLng _center = const LatLng(38.9783926, -76.9510632);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 15.0
        ),
      ),
    );
  }
}