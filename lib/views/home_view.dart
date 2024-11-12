import 'package:flutter/material.dart';
import 'package:laboratory/views/tabs/dashboard_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'tabs/places_tab.dart';
import 'tabs/settings_tab.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentTab = 0;

  late List<BottomNavigationBarItem> tabs;

  List<Widget> views = [
    const DashboardTab(),
    PlacesTab(),
    const SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    tabs = [
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        label: AppLocalizations.of(context)!.tab_dashboard,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.map),
        label: AppLocalizations.of(context)!.tab_maps,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.settings),
        label: AppLocalizations.of(context)!.tab_settings,
      ),
    ];

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
