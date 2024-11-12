import 'package:equatable/equatable.dart';

abstract class PlacesEvent extends Equatable {}

class LoaderEvent extends PlacesEvent {
  @override
  List<Object?> get props => [];
}

class LoadedEvent extends PlacesEvent {
  @override
  List<Object?> get props => [];
}
