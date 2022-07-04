import 'package:flutter/material.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/screens/main/components/side_menu.dart';
import 'package:nfcentralis/screens/orderer/list_orderer/body.dart';

class ListOrdererScreen extends StatelessWidget {
  const ListOrdererScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setPageTitle("Liste des donneurs d'ordres", context);
    return Responsive(
        mobile: Scaffold(
            key: const Key("Liste des donneurs d'ordres"),
            drawer: const SideMenu(),
            appBar: AppBar(
              title: const Text("Liste des donneurs d'ordres"),
              backgroundColor: secondaryColor,
            ),
            body: const ListOrderer()),
        desktop: Scaffold(
          key: const ValueKey("Liste des donneurs d'ordres"),
          drawer: const SideMenu(),
          body: SafeArea(
              child: Row(
            children: const [
              Expanded(
                child: SideMenu(),
              ),
              Expanded(
                flex: 5,
                child: ListOrderer(),
              )
            ],
          )),
        ));
  }
}
