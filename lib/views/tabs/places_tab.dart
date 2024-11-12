import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratory/business/places/event/places_events.dart';
import 'package:laboratory/business/places/placesbloc.dart';
import 'package:laboratory/business/places/state/places_state.dart';
import 'package:laboratory/data/places_model.dart';
import 'package:laboratory/routes/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlacesTab extends StatelessWidget {
  PlacesTab({super.key});

  var placesBloc = PlacesBloc()..add(LoaderEvent());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => placesBloc,
      child: Scaffold(
        body: BlocBuilder<PlacesBloc, PlacesState>(
          builder: (context, state) {
            switch (state) {
              case LoadingState _:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case SuccessState _:
                PlacesResponse response = state.props.first as PlacesResponse;

                if (response.places?.isEmpty ?? false) {
                  return Center(
                    child: Text(
                      AppLocalizations.of(context)!.no_places_yet,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: response.places?.length,
                  itemBuilder: (context, index) {
                    PlacesModel model =
                        response.places?[index] ?? PlacesModel();

                    return ListTile(
                      title: Text(model.title ?? ""),
                      leading: const Icon(Icons.location_on),
                    );
                  },
                );
              case ErrorState _:
                return Center(child: Text(state.props.first.toString() ?? ""));
              default:
                return const Center();
            }
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            var result = await context.push(path(AppRoutes.map));

            if (result == true) placesBloc.add(LoaderEvent());
          },
          icon: const Icon(Icons.location_on),
          label: Text(AppLocalizations.of(context)!.add_new_place_button),
        ),
      ),
    );
  }

  Future<void> delete(BuildContext context, int id) async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Are you sure you want to delete?"),
          actions: [
            TextButton(
              onPressed: () => context.pop(false),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () => context.pop(true),
              child: Text("Ok"),
            ),
          ],
        );
      },
    );

    if (result) {
      placesBloc.deletePlace(id: id);
      placesBloc.add(LoaderEvent());
    }
  }
}
