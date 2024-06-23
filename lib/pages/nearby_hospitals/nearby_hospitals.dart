import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyHospitals extends StatefulWidget {
  const NearbyHospitals({super.key});


  @override
  State<StatefulWidget> createState() => _NearbyHospitalsState();
}

class _NearbyHospitalsState extends State<NearbyHospitals> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Show Nearby Hospitals'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0
        ),
        myLocationEnabled: false,
      ),
    );
  }
}
