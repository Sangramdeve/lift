import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lift/core/models/place_model.dart';

class MapState extends Equatable {
  final LatLng currentLocation;
  final double zoom;
  final bool updateMap;
  final bool showSearchField;
  final bool showPlaceSuggestions;
  final List<PlaceName> placeSuggestions;
  final double snapSize;
  final double maxChildSize;
  final String pickUp;
  final String dropOff;
  final bool fieldState;
  final String placeName;
  final String textSelection;
  final bool isPickupInputValid;
  final bool isDropOffInputValid;
  final bool isLeftSelected;
  final bool locationForm;
  final bool showMatchedRides;

  const MapState({
    required this.currentLocation,
    required this.zoom,
    required this.updateMap,
    required this.showSearchField,
    required this.textSelection,
    required this.showPlaceSuggestions,
    required this.placeSuggestions,
    required this.snapSize,
    required this.maxChildSize,
    required this.pickUp,
    required this.dropOff,
    required this.fieldState,
    required this.placeName,
    required this.isPickupInputValid,
    required this.isDropOffInputValid,
    required this.isLeftSelected,
    required this.locationForm,
    required this.showMatchedRides,
  });

  factory MapState.initial() {
    return const MapState(
      currentLocation: LatLng(28.6139, 77.2090),
      zoom: 1,
      updateMap: false,
      showSearchField: false,
      textSelection: '',
      showPlaceSuggestions: false,
      placeSuggestions: [],
      snapSize: 0.40,
      maxChildSize: .70,
      pickUp: '',
      dropOff: '',
      fieldState: false,
      placeName: 'Current location',
      isPickupInputValid: false,
      isDropOffInputValid: false,
      isLeftSelected: true,
      locationForm: false,
      showMatchedRides: false,
    );
  }

  MapState copyWith({
    LatLng? currentLocation,
    double? zoom,
    bool? updateMap,
    bool? showSearchField,
    String? textSelection,
    List<PlaceName>? placeSuggestions,
    bool? showPlaceSuggestions,
    double? snapSize,
    double? maxChildSize,
    String? pickUp,
    String? dropOff,
    bool? fieldState,
    String? placeName,
    bool? isPickupInputValid,
    bool? isDropOffInputValid,
    bool? isLeftSelected,
    bool? locationForm,
    bool? showMatchedRides,
  }) {
    return MapState(
      currentLocation: currentLocation ?? this.currentLocation,
      zoom: zoom ?? this.zoom,
      updateMap: updateMap ?? this.updateMap,
      showSearchField: showSearchField ?? this.showSearchField,
      textSelection: textSelection ?? this.textSelection,
      showPlaceSuggestions: showPlaceSuggestions ?? this.showPlaceSuggestions,
      placeSuggestions: placeSuggestions ?? this.placeSuggestions,
      snapSize: snapSize ?? this.snapSize,
      maxChildSize: maxChildSize ?? this.maxChildSize,
      pickUp: pickUp ?? this.pickUp,
      dropOff: dropOff ?? this.dropOff,
      fieldState: fieldState ?? this.fieldState,
      placeName: placeName ?? this.placeName,
      isPickupInputValid: isPickupInputValid ?? this.isPickupInputValid,
      isDropOffInputValid: isDropOffInputValid ?? this.isDropOffInputValid,
      isLeftSelected: isLeftSelected ?? this.isLeftSelected,
      locationForm: locationForm ?? this.locationForm,
      showMatchedRides: showMatchedRides ?? this.showMatchedRides,
    );
  }

  @override
  List<Object?> get props => [
        currentLocation,
        zoom,
        updateMap,
        showSearchField,
        textSelection,
        placeSuggestions,
        showPlaceSuggestions,
        snapSize,
        maxChildSize,
        pickUp,
        dropOff,
        fieldState,
        placeName,
        isPickupInputValid,
        isDropOffInputValid,
        isLeftSelected,
        locationForm,
        showMatchedRides
      ];
}
