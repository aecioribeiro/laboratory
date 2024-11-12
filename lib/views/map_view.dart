import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:laboratory/business/places/event/places_events.dart';
import 'package:laboratory/business/places/placesbloc.dart';
import 'package:laboratory/data/places_model.dart';
import 'package:go_router/go_router.dart';

class MapView extends StatefulWidget {
  const MapView(this.placesModel, {super.key});

  final PlacesModel? placesModel;

  @override
  State<StatefulWidget> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  MapViewState();

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  late double latitude;
  late double longitude;
  late String title;

  TextEditingController titleController = TextEditingController();

  static const CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    super.initState();

    latitude = widget.placesModel != null
        ? double.parse(widget.placesModel?.lat ?? "0")
        : kGooglePlex.target.latitude;
    longitude = widget.placesModel != null
        ? double.parse(widget.placesModel?.lng ?? "0")
        : kGooglePlex.target.longitude;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.placesModel?.title ?? ""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Stack(
          children: [
            GoogleMap(
              myLocationEnabled: true,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(latitude, longitude),
                zoom: 14.4746,
              ),
              onCameraMove: (position) {
                latitude = position.target.latitude;
                longitude = position.target.longitude;
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Image.asset(
              "assets/map_pin.png",
              scale: 1.5,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
                  Transform.translate(
                offset: const Offset(158, 270),
                child: child,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          pinPlace();
        },
        icon: const Icon(Icons.location_on),
        label: Text(AppLocalizations.of(context)!.add_here_button),
      ),
    );
  }

  void pinPlace() async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.add_title),
          content: TextField(
            controller: titleController,
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(false),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                context.pop(true);
              },
              child: const Text("Ok"),
            )
          ],
        );
      },
    );

    if (result) addThisPlace();
  }

  Future<void> addThisPlace() async {
    final placeBloc = PlacesBloc()..add(LoaderEvent());
    final placeModel = PlacesModel(
      createdAt: DateTime.now().toString(),
      title: titleController.text,
      lat: latitude.toString(),
      lng: longitude.toString(),
    );

    placeBloc.addPlace(place: placeModel);
    context.pop(true);
  }
}
