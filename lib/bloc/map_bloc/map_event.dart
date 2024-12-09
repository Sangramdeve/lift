import 'package:equatable/equatable.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnMapCreated extends MapEvent {}

class ShowSearchField extends MapEvent {
  final String searchType;

  const ShowSearchField({required this.searchType});
  @override
  List<Object> get props => [searchType];
}

class OnPickupLocationFieldChanged extends MapEvent {
  final String pickUpEvent;

  const OnPickupLocationFieldChanged({required this.pickUpEvent});

  @override
  List<Object> get props => [pickUpEvent];
}

class DropOffFieldChanged extends MapEvent {
  final String dropOffEvent;

  const DropOffFieldChanged({required this.dropOffEvent});

  @override
  List<Object> get props => [dropOffEvent];
}

class ShowSuggestion extends MapEvent {}

class PlaceSelected extends MapEvent {
  final String placeName;

  const PlaceSelected({required this.placeName});

  @override
  List<Object> get props => [placeName];
}

class Lift extends MapEvent {}

class LocationForm extends MapEvent {
  final String name;

  const LocationForm({required this.name});
  @override
  List<Object> get props => [name];
}

class ConfirmButtons extends MapEvent {
  final String confirmValue;

  const ConfirmButtons({required this.confirmValue});
  @override
  List<Object> get props => [confirmValue];
}

class LocateEvents extends MapEvent {
  final String locateType;
  const LocateEvents({required  this.locateType});
  @override
  List<Object> get props => [locateType];
}

class ClearTextFieldState extends MapEvent {
  final String textField;

  const ClearTextFieldState({required this.textField});

  @override
  List<Object> get props => [textField];
}

class ShowMatches extends MapEvent{}