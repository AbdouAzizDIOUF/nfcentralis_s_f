// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/screens/main/components/side_menu.dart';
import 'package:nfcentralis/screens/user/detail_user/body.dart';

class DetailUserScreen extends StatefulWidget {
  final dynamic userId;
  const DetailUserScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  DetailUserScreenState createState() => DetailUserScreenState();
}

class DetailUserScreenState extends State<DetailUserScreen> {
  @override
  Widget build(BuildContext context) {
    setPageTitle(
        "Profil de " + widget.userId.lastName! + " " + widget.userId.firstName!,
        context);
    return Responsive(
        mobile: Scaffold(
          key: Key("Profil de " +
              widget.userId.lastName! +
              " " +
              widget.userId.firstName!),
          drawer: const SideMenu(),
          appBar: AppBar(
            title: Text("Profil de " +
                widget.userId.lastName! +
                " " +
                widget.userId.firstName!),
            backgroundColor: secondaryColor,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white70,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: DetailUser(user: widget.userId),
        ),
        desktop: Scaffold(
          key: Key("Profil de " +
              widget.userId.lastName! +
              " " +
              widget.userId.firstName!),
          drawer: const SideMenu(),
          body: SafeArea(
              child: Row(
            children: [
              const Expanded(
                child: SideMenu(),
              ),
              Expanded(
                flex: 5,
                child: DetailUser(user: widget.userId),
              )
            ],
          )),
        ));
  }
}
