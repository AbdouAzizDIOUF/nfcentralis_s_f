import 'package:flutter/material.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/screens/installations/list_installations/body.dart';
import 'package:nfcentralis/screens/main/components/side_menu.dart';

class ListInstallationScreen extends StatelessWidget {
  const ListInstallationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setPageTitle("Liste des installations", context);
    return Responsive(
        mobile: Scaffold(
            key: const Key('Liste des installations'),
            drawer: const SideMenu(),
            appBar: AppBar(
              title: const Text("Liste des installations"),
              backgroundColor: secondaryColor,
            ),
            body: const ListInstallations()),
        desktop: Scaffold(
          key: const ValueKey('Liste des installations'),
          drawer: const SideMenu(),
          body: SafeArea(
              child: Row(
            children: const [
              Expanded(
                child: SideMenu(),
              ),
              Expanded(
                flex: 5,
                child: ListInstallations(),
              )
            ],
          )),
        ));
  }
}
