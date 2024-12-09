import 'package:equatable/equatable.dart';

class PermissionState extends Equatable {
  final bool isLocationPermissionGranted;
  final bool isLocationPermissionDeniedOnce;
  final bool isLocationPermissionDeniedForever;

  const PermissionState({
    required this.isLocationPermissionGranted,
    required this.isLocationPermissionDeniedOnce,
    required this.isLocationPermissionDeniedForever,
  });

  factory PermissionState.initial() {
    return const PermissionState(
      isLocationPermissionGranted: false,
      isLocationPermissionDeniedOnce: false,
      isLocationPermissionDeniedForever: false,
    );
  }

  PermissionState copyWith({
    bool? isLocationPermissionGranted,
    bool? isLocationPermissionDeniedOnce,
    bool? isLocationPermissionDeniedForever,
  }) {
    return PermissionState(
      isLocationPermissionGranted: isLocationPermissionGranted ?? this.isLocationPermissionGranted,
      isLocationPermissionDeniedOnce: isLocationPermissionDeniedOnce ?? this.isLocationPermissionDeniedOnce,
      isLocationPermissionDeniedForever: isLocationPermissionDeniedForever ?? this.isLocationPermissionDeniedForever,
    );
  }

  @override
  List<Object?> get props => [
    isLocationPermissionGranted,
    isLocationPermissionDeniedOnce,
    isLocationPermissionDeniedForever,
  ];
}
