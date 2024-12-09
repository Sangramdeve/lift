class PlaceName {
  final String location;
  final Coordinates coordinates;

  PlaceName({required this.location, required this.coordinates});

  factory PlaceName.fromJson(Map<String, dynamic> json) {
    return PlaceName(
      location: json['location'],
      coordinates: Coordinates.fromJson(json['coordinates']),
    );
  }
}

class Coordinates {
  final double latitude;
  final double longitude;

  Coordinates({required this.latitude, required this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
