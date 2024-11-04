import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsTab extends StatefulWidget {
  const MapsTab({super.key});

  @override
  State<StatefulWidget> createState() => MapsTabState();
}

class MapsTabState extends State<MapsTab> {
  MapsTabState();

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          goToTheLake();
        },
        icon: const Icon(Icons.location_on),
        label: const Text("Go to Lake"),
      ),
    );
  }

  Future<void> goToTheLake() async {
    GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
  }
}
