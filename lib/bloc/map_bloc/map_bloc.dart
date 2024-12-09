import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lift/bloc/repositories/repositories.dart';
import 'package:lift/core/models/place_model.dart';
import 'package:lift/core/services/static_function.dart';

import '../../core/constants/json_data.dart';
import 'map_event.dart';
import 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final BlocRepositories blocRepositories;

  MapBloc(this.blocRepositories) : super(MapState.initial()) {

    on<OnMapCreated>((event, emit) async {
      Position? position = await blocRepositories.fetchUserLocation();
      /* String currentPlaceName = await mapRepositories
          .fetchCurrentPlaceName(LatLng(position.latitude, position.longitude));*/
      emit(state.copyWith(
          currentLocation: LatLng(position.latitude, position.longitude),
          zoom: 16,
          updateMap: true,
          placeName: state.placeName));
    });

    on<ShowSearchField>((event, emit) {
      if (event.searchType == 'search_bar') {
        emit(state.copyWith(
          showSearchField: !state.showSearchField,
          showPlaceSuggestions: !state.showPlaceSuggestions,
          pickUp: state.placeName,
          snapSize: state.showSearchField ? 0.40 : 0,
          maxChildSize: state.showSearchField ? 0.70 : .01,
          textSelection: event.searchType,
        ));
      } else if (event.searchType == 'Search Destination') {
        emit(state.copyWith(
          showSearchField: !state.showSearchField,
          showPlaceSuggestions: !state.showPlaceSuggestions,
          snapSize: state.showSearchField ? 0.40 : 0,
          maxChildSize: state.showSearchField ? 0.70 : .01,
          pickUp: state.placeName,
          textSelection: event.searchType,
        ));
      } else if (event.searchType == 'clear_State') {
        emit(state.copyWith(
          showSearchField: !state.showSearchField,
          showPlaceSuggestions: !state.showPlaceSuggestions,
          snapSize: state.showSearchField ? 0.40 : 0,
          maxChildSize: state.showSearchField ? 0.70 : .01,
          pickUp: '',
          dropOff: '',
          textSelection: '',
        ));
      }
    });

    on<OnPickupLocationFieldChanged>((event, emit) {
      emit(state.copyWith(
          pickUp: event.pickUpEvent,
          isPickupInputValid: GlobalFunction.validateInput(event.pickUpEvent),
          textSelection: '',
          fieldState: true));
      if (state.isPickupInputValid) {
        List<dynamic> decodedJson = jsonDecode(placeJsonData);
        List<PlaceName> placeSuggestionsList =
            decodedJson.map((json) => PlaceName.fromJson(json)).toList();
        emit(state.copyWith(placeSuggestions: placeSuggestionsList));
      }
    });

    on<DropOffFieldChanged>((event, emit) {
      emit(state.copyWith(
          dropOff: event.dropOffEvent,
          textSelection: '',
          isDropOffInputValid: GlobalFunction.validateInput(event.dropOffEvent),
          fieldState: false));
      if (state.isDropOffInputValid) {
        List<dynamic> decodedJson = jsonDecode(placeJsonData);
        List<PlaceName> placeSuggestionsList =
            decodedJson.map((json) => PlaceName.fromJson(json)).toList();
        emit(state.copyWith(placeSuggestions: placeSuggestionsList));
      }
    });

    on<PlaceSelected>((event, emit) {
      if (state.fieldState) {
        emit(state.copyWith(pickUp: event.placeName));
      } else if (state.fieldState == false) {
        emit(state.copyWith(dropOff: event.placeName));

      }
    });

    on<Lift>((event, emit) {
      emit(state.copyWith(isLeftSelected: !state.isLeftSelected));
    });

    on<LocationForm>((event, emit) {
      if (event.name == 'HOME') {
        emit(state.copyWith(
            locationForm: true, snapSize: .70, maxChildSize: .70));
      } else if (event.name == 'WORK') {
        emit(state.copyWith(
            locationForm: true, snapSize: .70, maxChildSize: .70));
      } else if (event.name == 'OTHER') {
        emit(state.copyWith(
            locationForm: true, snapSize: .70, maxChildSize: .70));
      }
    });

    on<ConfirmButtons>((event, emit) {
      if (event.confirmValue == 'Cancel') {
        emit(state.copyWith(
          locationForm: !state.locationForm,
          snapSize: 0.40,
          maxChildSize: .40,
        ));
      } else if (event.confirmValue == 'Search Location') {
        emit(state.copyWith(
            showSearchField: !state.showSearchField,
            showPlaceSuggestions: !state.showPlaceSuggestions,
            snapSize: state.showSearchField ? 0.40 : 0,
            maxChildSize: state.showSearchField ? 0.70 : .01,
            locationForm: !state.locationForm));
      }
    });

    on<LocateEvents>((event, emit) {
      if (event.locateType == '') {
      } else if (event.locateType == '') {}
    });

    on<ClearTextFieldState>((event, emit) {
      if (event.textField == 'Pick-up') {
        emit(state.copyWith(pickUp: ''));
      } else if (event.textField == 'Drop-off') {
        emit(state.copyWith(dropOff: ''));
      }
    });

    on<ShowMatches>((event, emit) {
      emit(state.copyWith(
        showSearchField: !state.showSearchField,
        showPlaceSuggestions: !state.showPlaceSuggestions,
        showMatchedRides: true,
      ));
    });

  }
}
