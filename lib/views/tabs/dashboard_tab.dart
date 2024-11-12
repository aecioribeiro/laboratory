import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratory/business/articles/event/articles_events.dart';
import 'package:laboratory/business/articles/newsbloc.dart';
import 'package:laboratory/business/articles/state/articles_state.dart';
import 'package:laboratory/data/articles_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticlesBloc()..add(LoaderEvent()),
      child: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (context, state) {
          switch (state) {
            case LoadingState _:
              return const Center(child: CircularProgressIndicator());
            case SuccessState _:
              ArticlesResponse response = state.props.first as ArticlesResponse;

              return ListView.builder(
                itemCount: (response.articles?.length ?? 0) + 1,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                itemBuilder: (context, index) {
                  // 20 elements
                  // [0...19]
                  if (index == response.articles?.length) {
                    return Center(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                            AppLocalizations.of(context)!.load_more_button),
                      ),
                    );
                  }

                  ArticlesModel model =
                      response.articles?[index] ?? ArticlesModel();

                  return Column(
                    children: [
                      model.urlToImage != null
                          ? Image.network(model.urlToImage ?? "")
                          : const Center(),
                      ListTile(
                        title: Text(model.title ?? ""),
                        subtitle: Text(model.description ?? ""),
                      ),
                    ],
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
    );
  }
}
