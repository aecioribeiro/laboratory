import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratory/routes/app_routes.dart';

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
                "assets/logo.jpg",
                height: 120,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () => context.push(path(AppRoutes.register)),
              child: const Text("Register"),
            ),
            ElevatedButton(
              onPressed: () => context.go(path(AppRoutes.home)),
              child: const Text("Login to my app"),
            ),
          ],
        ),
      ),
    );
  }
}
