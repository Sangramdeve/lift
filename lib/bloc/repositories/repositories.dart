import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lift/bloc/auth_bloc/auth_services/auth_services.dart';
import 'package:lift/bloc/map_bloc/services/location_service.dart';
import 'package:lift/bloc/map_bloc/services/node-api_service.dart';

class BlocRepositories {
  final LocationService locationService = LocationService();
  final BackendResponse backendResponse = BackendResponse();
  final AuthServices authServices = AuthServices();

  Future<Position> fetchUserLocation() =>
      locationService.determineUserCurrentPosition();

  Future<dynamic> findPlaceSuggestion() => locationService.placeSuggestion();

  Future<String> fetchCurrentPlaceName(LatLng currentLocation) =>
      locationService.getPlaceName(currentLocation);

  Future<dynamic> matchedRides() => backendResponse.findMatches();

  Future<User?> userCredential() => authServices.signInWithGoogle();

  Future<void> loginNewUser(userCreed) =>
      authServices.loginWithEmail(userCreed);
}
