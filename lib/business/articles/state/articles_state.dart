import 'package:equatable/equatable.dart';
import 'package:laboratory/data/articles_model.dart';

class ArticlesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class IdleState extends ArticlesState {}

class LoadingState extends ArticlesState {}

class SuccessState extends ArticlesState {
  SuccessState(this.response);

  final ArticlesResponse response;

  @override
  List<Object?> get props => [response];
}

class ErrorState extends ArticlesState {
  ErrorState(this.error);

  final Object? error;

  @override
  List<Object?> get props => [error];
}
