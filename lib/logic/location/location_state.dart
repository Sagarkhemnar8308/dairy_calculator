part of 'location_cubit.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

class LocationStateGranted extends LocationState {}

class LocationStateDenied extends LocationState {
  String? message;
  LocationStateDenied({this.message});
}

class LocationStateSkiped extends LocationState {}

class LocationPermitted extends LocationState {
  String? latitude;
  String? longnitude;
  LocationPermitted(this.latitude, this.longnitude);
}
