import 'package:flutter/material.dart';

import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/screens/main/components/side_menu.dart';
import 'package:nfcentralis/screens/orderer/detail_orderer/body.dart';

class DetailOrdererScreen extends StatefulWidget {
  final dynamic companyId;
  const DetailOrdererScreen({
    Key? key,
    required this.companyId,
  }) : super(key: key);

  @override
  DetailOrdererScreenState createState() => DetailOrdererScreenState();
}

class DetailOrdererScreenState extends State<DetailOrdererScreen> {
  @override
  Widget build(BuildContext context) {
    setPageTitle("Détail: " + widget.companyId.name!, context);
    return Responsive(
        mobile: Scaffold(
          key: Key(widget.companyId.name! + widget.companyId.zipcode!),
          drawer: const SideMenu(),
          appBar: AppBar(
            title: Text(widget.companyId.name!),
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
          body: DetailOrderer(company: widget.companyId),
        ),
        desktop: Scaffold(
          key: ValueKey(widget.companyId.name! + widget.companyId.zipcode!),
          drawer: const SideMenu(),
          body: SafeArea(
              child: Row(
            children: [
              const Expanded(
                child: SideMenu(),
              ),
              Expanded(
                flex: 5,
                child: DetailOrderer(company: widget.companyId),
              )
            ],
          )),
        ));
  }
}
