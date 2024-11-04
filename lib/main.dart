import 'package:flutter/material.dart';
import 'package:laboratory/routes/app_routes.dart';
import 'package:laboratory/views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Laboratory',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerDelegate: routing.routerDelegate,
      routeInformationParser: routing.routeInformationParser,
      routeInformationProvider: routing.routeInformationProvider,
    );
  }
}
