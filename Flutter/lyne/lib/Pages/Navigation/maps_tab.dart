import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapsTabWidget extends StatefulWidget {
  @override
  _MapsTabWidgetState createState() => _MapsTabWidgetState();
}

class _MapsTabWidgetState extends State<MapsTabWidget> {
  // Maps & location
  GoogleMapController mapController;
  List<Marker> _markers = <Marker>[];
  Position _currentLocation;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    _getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            38.990868,
            -76.934554,
          ),
          zoom: 17.5
        ),
        markers: Set<Marker>.of(_markers),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  void _getLocation() async {
    _currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    //mapController.moveCamera(CameraUpdate.newLatLng(LatLng(_currentLocation.latitude, _currentLocation.longitude)));
    
    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: MarkerId("curr_location"),
        //position: LatLng(_currentLocation.latitude, _currentLocation.longitude),
        position: LatLng(38.990868, -76.934554),
      );
      _markers.add(marker);
    });
  }
}