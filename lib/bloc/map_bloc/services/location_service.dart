import 'dart:async';
import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> determineUserCurrentPosition() async {
    LocationPermission locationPermission;

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied) {
      // Request location permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        // Optionally show a dialog or prompt to request location permission
      }
    }

    if (locationPermission == LocationPermission.deniedForever) {
      // Permissions are denied forever
    }
    return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.medium,
      distanceFilter: 100,
    ));
  }

  Future<String> getPlaceName(LatLng currentLocation) async {
    String placeName = '';
    List<Placemark> placeMarkList = await placemarkFromCoordinates(
        currentLocation.latitude, currentLocation.longitude);
    if (placeMarkList.isNotEmpty) {
      Placemark placeMark = placeMarkList.first;
      placeName = '${placeMark.name ?? ''}, '
          '${placeMark.locality ?? ''}, '
          '${placeMark.administrativeArea ?? ''}, '
          '${placeMark.postalCode ?? ''}, '
          '${placeMark.country ?? ''}';
      print(placeName);
      return placeName;
    }
    return placeName.isNotEmpty ? placeName : 'Current location';
  }

  Future<dynamic> placeSuggestion() async {
    final response = await http.get(Uri.parse(''));
    final json = jsonDecode(response.body);
    return response;
  }
}
