import 'package:flutter/material.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/screens/interventions/list_interventions/body.dart';
import 'package:nfcentralis/screens/main/components/side_menu.dart';

class ListInterventionScreen extends StatelessWidget {
  const ListInterventionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setPageTitle("Liste des interventions", context);
    return Responsive(
        mobile: Scaffold(
            key: const Key('Liste des interventions'),
            drawer: const SideMenu(),
            appBar: AppBar(
              title: const Text("Liste des interventions"),
              backgroundColor: secondaryColor,
            ),
            body: const ListInterventions()),
        desktop: Scaffold(
          key: const Key('Liste des interventions'),
          drawer: const SideMenu(),
          body: SafeArea(
              child: Row(
            children: const [
              Expanded(
                child: SideMenu(),
              ),
              Expanded(
                flex: 5,
                child: ListInterventions(),
              )
            ],
          )),
        ));
  }
}
