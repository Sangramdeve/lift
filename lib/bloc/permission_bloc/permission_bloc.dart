import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lift/bloc/permission_bloc/permission_event.dart';
import 'package:lift/bloc/permission_bloc/permission_state.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  PermissionBloc() : super(PermissionState.initial()) {
    on<LocationPermissionRequested>(_onLocationPermissionRequested);
  }

  Future<void> _onLocationPermissionRequested(
      LocationPermissionRequested event, Emitter<PermissionState> emit) async {
    final status = await Permission.location.status;
    if (status.isGranted) {
      emit(state.copyWith(isLocationPermissionGranted: true));
    } else if (status.isDenied) {
      // Request permission
      final newStatus = await Permission.location.request();

      if (newStatus.isGranted) {
        emit(state.copyWith(isLocationPermissionGranted: true));
      } else if (newStatus.isPermanentlyDenied) {
        emit(state.copyWith(isLocationPermissionDeniedForever: true));
      } else {
        emit(state.copyWith(isLocationPermissionDeniedOnce: true));
      }
    } else if (status.isPermanentlyDenied) {
      emit(state.copyWith(isLocationPermissionDeniedForever: true));
    }
  }
}
