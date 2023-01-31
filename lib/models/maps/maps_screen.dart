import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shop_application/models/maps/cubit/cubit_cubit.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapCubit, CubitState>(
      listener: (context, state) {},
      builder: (context, s) {
        return Scaffold(
          floatingActionButton: Container(
            margin: EdgeInsets.symmetric(horizontal: 60),
            child: FloatingActionButton(
                child: Icon(Icons.location_on),
                onPressed: () => MapCubit.get(context)
                    .launchMap(LatLng(31.508641133665783, 34.484868273139))),
          ),
          body: Stack(
            children: [
              GoogleMap(
                  onMapCreated: MapCubit.get(context).cameraPosition,
                  onTap: (LatLng position) {
                    MapCubit.get(context).moveCamera(position);
                    log('latitude ${position.latitude}');
                    log('longitude ${position.longitude}');
                  },
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(31.5, 34.46667),
                    zoom: 11.0,
                  )),
              // Marker(markerId: markerId,)
              // Text()
            ],
          ),
        );
      },
    );
  }
}
