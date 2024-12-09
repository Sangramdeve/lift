abstract class PermissionEvent {}

class LocationPermissionRequested extends PermissionEvent {}

class PermissionGranted extends PermissionEvent {}

class PermissionDenied extends PermissionEvent {}

class PermissionDeniedForever extends PermissionEvent {}
