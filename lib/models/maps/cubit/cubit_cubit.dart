import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:meta/meta.dart';

part 'cubit_state.dart';

class MapCubit extends Cubit<CubitState> {
  MapCubit() : super(CubitInitial());
  static MapCubit get(context) => BlocProvider.of(context);

  late GoogleMapController mapController;
  Position? userCurrentPosition;
  final availableMaps = MapLauncher.installedMaps;
cameraPosition(GoogleMapController controller) async {
    mapController = controller;
  }
  moveCamera(LatLng newPosition) {
    mapController.animateCamera(CameraUpdate.newLatLngZoom(newPosition, 14));
  }
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  void launchMap(LatLng destination) async {
    // double originLat = userCurrentPosition!.latitude;
    // double originLon = userCurrentPosition!.longitude;
    double destLat = destination.latitude;
    double destLon = destination.longitude;
    final availableMaps = await MapLauncher.installedMaps;
    final selectedMap = availableMaps.first;

    selectedMap.showDirections(
      destination: Coords(destLat, destLon),
    );
  }

  goToMarket(LatLng destination) async {
    double originLat = userCurrentPosition!.latitude;
    double originLon = userCurrentPosition!.longitude;
    double destLat = destination.latitude;
    double destLon = destination.longitude;

    String googleMapUrl =
        "https://www.google.com/maps/dir/?api=1&origin=$originLat,$originLon&destination=$destLat,$destLon&travelmode=driving";

    //launch(googleMapUrl);
  }
}
