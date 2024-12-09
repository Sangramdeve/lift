import 'package:google_maps_flutter/google_maps_flutter.dart';

class RideDetails {
  String time;
  String date;
  String pickupLocation;
  LatLng pickupLatLng; // Updated property
  String dropLocation;
  LatLng dropLatLng; // Updated property
  String fare;
  bool hasVehicle;
  List<String> recurring;
  List<String> polyLines;

  RideDetails({
    required this.time,
    required this.date,
    required this.pickupLocation,
    required this.pickupLatLng,
    required this.dropLocation,
    required this.dropLatLng,
    required this.fare,
    required this.hasVehicle,
    required this.recurring,
    required this.polyLines,
  });

  factory RideDetails.fromSnapshot(Map<String,dynamic> json) {
    return RideDetails(
      time: json['Time'] ?? '',
      date: json['Date'] ?? '',
      pickupLocation: json['PickupLocation'] ?? '',
      pickupLatLng: LatLng(json['PickupLatLng'].latitude, json['PickupLatLng'].longitude), // Access latitude and longitude directly
      dropLocation: json['Destination'] ?? '',
      dropLatLng: LatLng(json['DestinationLatLng'].latitude, json['DestinationLatLng'].longitude), // Access latitude and longitude directly
      fare: json['Fare'] ?? '',
      hasVehicle: json['HasVehicle'] ?? false,
      recurring: List<String>.from(json['Recurring'] ?? []),
      polyLines: List<String>.from(json['Poly-lines'] ?? []),
    );
  }
}

class Ride {
  final String pickupLocation;
  final String destination;
  final String driverName;
  final int availableSeats;
  final double price;

  Ride({
    required this.pickupLocation,
    required this.destination,
    required this.driverName,
    required this.availableSeats,
    required this.price,
  });
}