import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart' as location_package;

class MapaWidget extends StatefulWidget {
  @override
  _MapaWidgetState createState() => _MapaWidgetState();
}

class _MapaWidgetState extends State<MapaWidget> {
  // Cria uma variável de estado para armazenar o status das permissões de localização
  PermissionStatus _locationStatus = PermissionStatus.denied;

  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    _requestLocationPermissions();
  }

  Future<void> _requestLocationPermissions() async {
    var status = await Permission.camera.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
    }

    if (await Permission.location.isRestricted) {
      // The OS restricts access, for example because of parental controls.
    }
    print(_locationStatus);

    setState(() {});
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    // Verifica se a permissão de localização foi concedida antes de usar a posição inicial da câmera
    final initialCameraPosition = _locationStatus == PermissionStatus.granted ? _kGooglePlex : CameraPosition(target: LatLng(0, 0));

    return Scaffold(
      body: GoogleMap(
// Passa a posição inicial da câmera para o mapa
        initialCameraPosition: initialCameraPosition,
// Define o tipo de mapa
        mapType: MapType.normal,
// Desativa a barra de zoom
        zoomControlsEnabled: false,
// Desativa a bússola
        compassEnabled: false,
// Desativa o botão de localização
        myLocationButtonEnabled: false,
// Desativa a exibição da marcação de posição atual
        myLocationEnabled: false,
// Callback executado quando o mapa é criado
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
