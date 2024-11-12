import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratory/routes/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:laboratory/views/widgets/custom_app_bar.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: CustomAppBar(),
            pinned: true,
            floating: false,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 12,
              (context, index) {
                return ListTile(
                  onTap: () {
                    print("on tap");
                  },
                  title: Text("Title"),
                  subtitle: Text("Subtitle"),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: OutlinedButton(
                onPressed: () => context.go(
                  path(AppRoutes.login),
                ),
                child: Text(AppLocalizations.of(context)!.logout_button),
              ),
            ),
          )
        ],
      ),
    );
  }
}
