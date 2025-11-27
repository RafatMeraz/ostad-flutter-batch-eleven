import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController _mapController;

  Set<Marker> _markers = <Marker>{
    Marker(
      markerId: MarkerId('office'),
      position: LatLng(23.795285011504653, 90.40711339563131),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange,
      ),
      onTap: () {
        print('on tap at my office location');
      },
      infoWindow: InfoWindow(title: 'My Office', onTap: () {}),
      draggable: true,
      onDragStart: (LatLng startLatLng) {
        print('Drag start: $startLatLng');
      },
      onDragEnd: (LatLng startLatLng) {
        print('Drag end: $startLatLng');
      },
    ),
    Marker(
      markerId: MarkerId('home'),
      position: LatLng(23.802865820721614, 90.40861710906029),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
      onTap: () {
        print('on tap at my office location');
      },
      infoWindow: InfoWindow(title: 'My Home', onTap: () {}),
      draggable: true,
      onDragStart: (LatLng startLatLng) {
        print('Drag start: $startLatLng');
      },
      onDragEnd: (LatLng startLatLng) {
        print('Drag end: $startLatLng');
      },
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        trafficEnabled: true,
        onTap: (LatLng latLng) {
          print('Tapped on : $latLng');
        },
        onLongPress: (LatLng latLng) {
          print('Long pressed on : $latLng');
        },
        initialCameraPosition: CameraPosition(
          zoom: 16,
          target: LatLng(23.793658483514, 90.40683698304692),
        ),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        markers: _markers,
        circles: <Circle>{
          Circle(
            circleId: CircleId('home-circle'),
            center: LatLng(23.802865820721614, 90.40861710906029),
            radius: 200,
            strokeColor: Colors.pink,
            strokeWidth: 3,
            fillColor: Colors.pink.withOpacity(0.1),
            visible: true,
            onTap: () {
              print('Tapped on circle');
            },
            consumeTapEvents: true,
          ),
          Circle(
            circleId: CircleId('random-circle'),
            center: LatLng(23.80876279044805, 90.40945898741484),
            radius: 200,
            strokeColor: Colors.blue,
            strokeWidth: 3,
            fillColor: Colors.blue.withOpacity(0.1),
            visible: true,
            onTap: () {
              print('Tapped on circle');
            },
            consumeTapEvents: true,
          ),
        },
        polylines: <Polyline>{
          Polyline(
            polylineId: PolylineId('home-to-office-line'),
            points: [
              LatLng(23.802865820721614, 90.40861710906029),
              LatLng(23.795285011504653, 90.40711339563131),
              LatLng(23.796237238443183, 90.41255727410316),
              LatLng(23.801399205475516, 90.41293177753687),
            ],
            color: Colors.purple,
            width: 4,
            startCap: Cap.roundCap,
            endCap: Cap.roundCap,
            onTap: () {},
            consumeTapEvents: true,
          ),
        },
        polygons: <Polygon>{
          Polygon(
            polygonId: PolygonId('random-polygon'),
            points: [
              LatLng(23.788664019030573, 90.40694139897823),
              LatLng(23.784166386675828, 90.40868919342756),
              LatLng(23.7877786174873, 90.41075684130192),
              LatLng(23.79255498972833, 90.40854871273041),
              LatLng(23.790920139702756, 90.40547456592321),
              LatLng(23.787021756986235, 90.40547456592321),
              LatLng(23.784573204843788, 90.40624670684338),
            ],
            fillColor: Colors.red.withOpacity(0.2),
            strokeColor: Colors.red,
            strokeWidth: 2,
          ),
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              _mapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(23.795285011504653, 90.40711339563131),
                    zoom: 15,
                  ),
                ),
              );
            },
            child: Icon(Icons.factory),
          ),
          FloatingActionButton(
            onPressed: () {
              _mapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(23.719435420479336, 90.36848187446594),
                    zoom: 15,
                  ),
                ),
              );
            },
            child: Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}
