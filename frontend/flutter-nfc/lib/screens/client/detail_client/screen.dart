// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/screens/client/detail_client/body.dart';
import 'package:nfcentralis/screens/main/components/side_menu.dart';

class DetailClientScreen extends StatefulWidget {
  final dynamic companyId;
  const DetailClientScreen({
    Key? key,
    required this.companyId,
  }) : super(key: key);

  @override
  DetailClientScreenState createState() => DetailClientScreenState();
}

class DetailClientScreenState extends State<DetailClientScreen> {
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
          body: DetailClient(company: widget.companyId),
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
                child: DetailClient(company: widget.companyId),
              )
            ],
          )),
        ));
  }
}
