import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'distance_state.dart';

class DistanceCubit extends Cubit<DistanceState> {
  DistanceCubit() : super(DistanceInitial());

  Future<void> calculateDistance({
    required double restaurantLat,
    required double restaurantLong,
  }) async {
    bool locationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    print(locationServiceEnabled);

    LocationPermission locationPermission = await Geolocator.checkPermission();
    print(locationPermission);
    if (locationPermission != LocationPermission.whileInUse &&
        locationPermission != LocationPermission.always) {
      locationPermission = await Geolocator.requestPermission();
    }
    try {
      emit(DistanceLoading());
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position.latitude);
      print(position.longitude);

      double distanceInMeters = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        restaurantLat,
        restaurantLong,
      );
      double distanceInKm = distanceInMeters / 1000;
      emit(DistanceSuccess(distance: "${distanceInKm.toStringAsFixed(2)} km"));
    } catch (e) {
      print("Error: $e");
      emit(DistanceFailure(msg: "Error getting distance"));
    }
  }
}
