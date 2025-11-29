import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GpsHomeScreen extends StatefulWidget {
  const GpsHomeScreen({super.key});

  @override
  State<GpsHomeScreen> createState() => _GpsHomeScreenState();
}

class _GpsHomeScreenState extends State<GpsHomeScreen> {
  Position? _currentPosition;

  Future<void> _getCurrentLocation() async {
    // // access permission given or not
    // LocationPermission permissionStatus = await Geolocator.checkPermission();
    // if (_isPermissionGranted(permissionStatus)) {
    //   // GPS service enable
    //   bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //   if (isServiceEnabled) {
    //     // Get current location
    //     _currentPosition = await Geolocator.getCurrentPosition();
    //     print(_currentPosition);
    //     setState(() {});
    //   } else {
    //     // -> Request service
    //     Geolocator.openLocationSettings();
    //   }
    // } else {
    //   // -> Request location permission
    //   LocationPermission permissionStatus =
    //       await Geolocator.requestPermission();
    //   if (_isPermissionGranted(permissionStatus)) {
    //     // Call this method again
    //     _getCurrentLocation();
    //   }
    // }
    await _handleLocationPermission(() async {
      _currentPosition = await Geolocator.getCurrentPosition();
      print(_currentPosition);
      setState(() {});
    });
  }

  Future<void> _listenCurrentLocation() async {
    // // access permission given or not
    // LocationPermission permissionStatus = await Geolocator.checkPermission();
    // if (_isPermissionGranted(permissionStatus)) {
    //   // GPS service enable
    //   bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //   if (isServiceEnabled) {
    //     // Listen current location
    //     Geolocator.getPositionStream().listen((position) {
    //       _currentPosition = position;
    //       setState(() {});
    //     });
    //   } else {
    //     // -> Request service
    //     Geolocator.openLocationSettings();
    //   }
    // } else {
    //   // -> Request location permission
    //   LocationPermission permissionStatus =
    //   await Geolocator.requestPermission();
    //   if (_isPermissionGranted(permissionStatus)) {
    //     // Call this method again
    //     _getCurrentLocation();
    //   }
    // }

    await _handleLocationPermission(() {
      Geolocator.getPositionStream().listen((position) {
        _currentPosition = position;
        setState(() {});
      });
    });
  }

  Future<void> _handleLocationPermission(VoidCallback onSuccess) async {
    // access permission given or not
    LocationPermission permissionStatus = await Geolocator.checkPermission();
    if (_isPermissionGranted(permissionStatus)) {
      // GPS service enable
      bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (isServiceEnabled) {
        onSuccess();
      } else {
        // -> Request service
        Geolocator.openLocationSettings();
      }
    } else {
      // -> Request location permission
      LocationPermission permissionStatus =
          await Geolocator.requestPermission();
      if (_isPermissionGranted(permissionStatus)) {
        // Call this method again
        _getCurrentLocation();
      }
    }
  }

  bool _isPermissionGranted(LocationPermission permissionStatus) {
    return permissionStatus == LocationPermission.always ||
        permissionStatus == LocationPermission.whileInUse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gps Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Current Location: $_currentPosition'),
            TextButton(
              onPressed: () {
                _getCurrentLocation();
              },
              child: Text('Current Location'),
            ),
            TextButton(
              onPressed: () {
                _listenCurrentLocation();
              },
              child: Text('Listen Current Location'),
            ),
          ],
        ),
      ),
    );
  }
}
