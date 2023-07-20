import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  final Function(
    double latitude,
    double longitude,
  ) onLocationSelected;

  const MapsPage({
    Key? key,
    required this.onLocationSelected,
  }) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  late Position userLocation;
  late GoogleMapController mapController;
  Set<Marker> markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    markers.add(
      Marker(
        markerId: const MarkerId('userMarker'),
        position: LatLng(
          userLocation.latitude,
          userLocation.longitude,
        ),
        infoWindow: const InfoWindow(
          title: 'Location',
        ),
      ),
    );
  }

  Future<Position> _getLocation() async {
    try {
      userLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
    } catch (e) {
      userLocation = 0 as Position;
    }
    return userLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: FutureBuilder(
        future: _getLocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GoogleMap(
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  userLocation.latitude,
                  userLocation.longitude,
                ),
                zoom: 15,
              ),
              markers: markers,
            );
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          widget.onLocationSelected(
            userLocation.latitude,
            userLocation.longitude,
          );
          mapController.animateCamera(
            CameraUpdate.newLatLngZoom(
              LatLng(
                userLocation.latitude,
                userLocation.longitude,
              ),
              15,
            ),
          );
          Navigator.pop(context);
        },
        label: const Text('Weather'),
        icon: const Icon(
          Icons.near_me,
        ),
      ),
    );
  }
}