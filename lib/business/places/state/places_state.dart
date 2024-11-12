import 'package:equatable/equatable.dart';
import 'package:laboratory/data/places_model.dart';

class PlacesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class IdleState extends PlacesState {}

class LoadingState extends PlacesState {}

class SuccessState extends PlacesState {
  SuccessState(this.response);

  final PlacesResponse response;

  @override
  List<Object?> get props => [response];
}

class ErrorState extends PlacesState {
  ErrorState(this.error);

  final Object? error;

  @override
  List<Object?> get props => [error];
}
