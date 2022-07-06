import 'package:nfcentralis/responsive.dart';
import 'package:flutter/material.dart';
import 'package:nfcentralis/screens/home/home_screen.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setPageTitle("Tableau de bord", context);
    return Scaffold(
      key: const Key("Dashboard"),
      drawer: const SideMenu(),
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            const Expanded(
              child: SideMenu(),
            ),
          const Expanded(
            flex: 5,
            child: HomeScreen(),
          )
        ],
      )),
    );
  }
}
