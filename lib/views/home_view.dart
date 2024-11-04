import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laboratory/routes/app_routes.dart';
import 'package:laboratory/views/tabs/dashboard_tab.dart';

import 'tabs/maps_tab.dart';
import 'tabs/settings_tab.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentTab = 0;

  List<BottomNavigationBarItem> tabs = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Dashboard",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.map),
      label: "Maps",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Settings",
    ),
  ];

  List<Widget> views = [
    const DashboardTab(),
    const MapsTab(),
    const SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: tabs,
        currentIndex: currentTab,
        onTap: (value) => setState(() {
          currentTab = value;
        }),
      ),
      body: views[currentTab],
    );
  }
}
