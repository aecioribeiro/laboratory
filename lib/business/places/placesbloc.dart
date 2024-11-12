import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratory/business/places/event/places_events.dart';
import 'package:laboratory/business/places/state/places_state.dart';
import 'package:laboratory/repository/database/sessiondao.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  PlacesBloc() : super(IdleState()) {
    on(fetchPlaces);
  }

  SessionDAO sessionDAO = SessionDAO();

  Future<void> fetchPlaces(
    PlacesEvent event,
    Emitter<PlacesState> state,
  ) async {
    emit(LoadingState());

    try {
      var response = await sessionDAO.getPlaces();
      emit(SuccessState(response));
    } catch (e) {
      emit(ErrorState(e));
    }
  }
}
