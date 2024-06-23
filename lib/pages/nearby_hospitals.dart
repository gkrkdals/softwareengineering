import 'package:flutter/material.dart';

class NearbyHospitals extends StatefulWidget {
  const NearbyHospitals({super.key});


  @override
  State<StatefulWidget> createState() => _NearbyHospitalsState();
}

class _NearbyHospitalsState extends State<NearbyHospitals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Show Nearby Hospitals'),
      ),
      body: Container(),
    );
  }
}
