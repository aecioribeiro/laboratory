import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratory/routes/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () => context.go(path(AppRoutes.home)),
            child: Text(AppLocalizations.of(context)!.login_button),
          ),
        ],
      )),
    );
  }
}
