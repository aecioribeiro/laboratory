import 'package:go_router/go_router.dart';
import 'package:laboratory/views/home_view.dart';
import 'package:laboratory/views/login_view.dart';
import 'package:laboratory/views/map_view.dart';
import 'package:laboratory/views/register_view.dart';

enum AppRoutes {
  login,
  register,
  forgetPassword,
  home,
  settings,
  map,
}

String path(AppRoutes route) {
  return "/${route.name}";
}

final routing = GoRouter(
  initialLocation: path(AppRoutes.login),
  routes: [
    GoRoute(
      path: path(AppRoutes.login),
      name: AppRoutes.login.name,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: path(AppRoutes.register),
      name: AppRoutes.register.name,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: path(AppRoutes.home),
      name: AppRoutes.home.name,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: path(AppRoutes.map),
      name: AppRoutes.map.name,
      builder: (context, state) => const MapView(),
    ),
  ],
  redirect: (context, state) {
    // if (persistance.userIsLogged()) {
    //   return path(AppRoutes.home);
    // }

    return state.fullPath;
  },
);
