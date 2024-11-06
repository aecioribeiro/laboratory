import 'package:equatable/equatable.dart';

abstract class ArticlesEvent extends Equatable {}

class LoaderEvent extends ArticlesEvent {
  @override
  List<Object?> get props => [];
}

class LoadedEvent extends ArticlesEvent {
  @override
  List<Object?> get props => [];
}
