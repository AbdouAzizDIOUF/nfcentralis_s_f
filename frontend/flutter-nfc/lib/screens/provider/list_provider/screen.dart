import 'package:flutter/material.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/screens/main/components/side_menu.dart';
import 'package:nfcentralis/screens/provider/list_provider/body.dart';

class ListProviderScreen extends StatelessWidget {
  const ListProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setPageTitle('Liste des prestataires', context);
    return Responsive(
        mobile: Scaffold(
            key: const Key("Liste des prestataires"),
            drawer: const SideMenu(),
            appBar: AppBar(
              title: const Text("Liste des prestataires"),
              backgroundColor: secondaryColor,
            ),
            body: const ListProvider()),
        desktop: Scaffold(
          key: const ValueKey("Liste des prestataires"),
          drawer: const SideMenu(),
          body: SafeArea(
              child: Row(
            children: const [
              Expanded(
                child: SideMenu(),
              ),
              Expanded(
                flex: 5,
                child: ListProvider(),
              )
            ],
          )),
        ));
  }
}
