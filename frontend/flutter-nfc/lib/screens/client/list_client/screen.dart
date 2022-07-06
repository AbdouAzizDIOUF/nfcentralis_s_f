import 'package:flutter/material.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/screens/client/list_client/body.dart';
import 'package:nfcentralis/screens/main/components/side_menu.dart';

class ListClientScreen extends StatelessWidget {
  const ListClientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setPageTitle("Liste des clients", context);
    return Responsive(
        mobile: Scaffold(
          key: const Key('Liste des clients'),
          drawer: const SideMenu(),
          appBar: AppBar(
            title: const Text("Liste des clients"),
            backgroundColor: secondaryColor,
          ),
          body: const ListClient(),
        ),
        desktop: Scaffold(
          key: const ValueKey('Liste des clients'),
          drawer: const SideMenu(),
          body: SafeArea(
              child: Row(
            children: const [
              Expanded(
                child: SideMenu(),
              ),
              Expanded(
                flex: 5,
                child: ListClient(),
              )
            ],
          )),
        ));
  }
}
