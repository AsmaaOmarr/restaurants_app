part of 'distance_cubit.dart';

@immutable
sealed class DistanceState {}

final class DistanceInitial extends DistanceState {}

final class DistanceLoading extends DistanceState {}

final class DistanceSuccess extends DistanceState {
  final String distance;

  DistanceSuccess({required this.distance});
}

final class DistanceFailure extends DistanceState {
   final String msg;

  DistanceFailure({required this.msg});
}
