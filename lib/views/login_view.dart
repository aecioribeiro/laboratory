import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratory/routes/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/logo.png",
                height: 120,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () => context.push(path(AppRoutes.register)),
              child: Text(AppLocalizations.of(context)!.register_button),
            ),
            ElevatedButton(
              onPressed: () => context.go(path(AppRoutes.home)),
              child: Text(AppLocalizations.of(context)!.login_button),
            ),
          ],
        ),
      ),
    );
  }
}
