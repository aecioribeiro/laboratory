import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratory/routes/app_routes.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: () => context.go(
          path(AppRoutes.login),
        ),
        child: const Text("Logout"),
      ),
    );
  }
}
