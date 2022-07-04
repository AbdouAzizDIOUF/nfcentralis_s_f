import 'package:flutter/material.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/screens/main/components/side_menu.dart';
import 'package:nfcentralis/screens/user/list_user/body.dart';

class ListUserScreen extends StatelessWidget {
  const ListUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setPageTitle("Liste des utilisateurs", context);
    return Responsive(
        mobile: Scaffold(
          key: const Key('Liste des utilisateurs'),
          drawer: const SideMenu(),
          appBar: AppBar(
            title: const Text("Liste des utilisateurs"),
            backgroundColor: secondaryColor,
          ),
          body: const ListUser(),
        ),
        desktop: Scaffold(
          key: const ValueKey('Liste des utilisateurs'),
          drawer: const SideMenu(),
          body: SafeArea(
              child: Row(
            children: const [
              Expanded(
                child: SideMenu(),
              ),
              Expanded(
                flex: 5,
                child: ListUser(),
              )
            ],
          )),
        ));
  }
}
