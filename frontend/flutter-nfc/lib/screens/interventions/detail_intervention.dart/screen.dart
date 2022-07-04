// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/screens/interventions/detail_intervention.dart/body.dart';
import 'package:nfcentralis/screens/main/components/side_menu.dart';

class DetailInterventionScreen extends StatefulWidget {
  final dynamic interventionId;
  const DetailInterventionScreen({
    Key? key,
    required this.interventionId,
  }) : super(key: key);

  @override
  DetailInterventionScreenState createState() =>
      DetailInterventionScreenState();
}

class DetailInterventionScreenState extends State<DetailInterventionScreen> {
  @override
  Widget build(BuildContext context) {
    setPageTitle("Intervention - " + widget.interventionId.name!, context);
    return Responsive(
        mobile: Scaffold(
          key: Key("Intervention - " + widget.interventionId.name!),
          drawer: const SideMenu(),
          appBar: AppBar(
            title: Text("Intervention - " + widget.interventionId.name!),
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
          body: DetailIntervention(intervention: widget.interventionId),
        ),
        desktop: Scaffold(
          key: Key("Intervention - " + widget.interventionId.name!),
          drawer: const SideMenu(),
          body: SafeArea(
              child: Row(
            children: [
              const Expanded(
                child: SideMenu(),
              ),
              Expanded(
                flex: 5,
                child: DetailIntervention(intervention: widget.interventionId),
              )
            ],
          )),
        ));
  }
}
