// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nfcentralis/components/loading_spinner.dart';

import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/controllers/client_controller.dart';
import 'package:nfcentralis/models/client.dart';
import 'package:nfcentralis/repository/client_repository.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/screens/client/detail_client/body.dart';
import 'package:nfcentralis/screens/main/components/side_menu.dart';

class DetailClientScreen extends StatefulWidget {
  final dynamic clientId;
  const DetailClientScreen({
    Key? key,
    required this.clientId,
  }) : super(key: key);

  @override
  DetailClientScreenState createState() => DetailClientScreenState();
}

class DetailClientScreenState extends State<DetailClientScreen> {
  late Client client;
  var clientController = ClientController(ClientRepository());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Client>(
        future: clientController.getClientById(widget.clientId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              children: const [
                SizedBox(height: defaultPadding),
                Center(child: LoadingSpinner()),
              ],
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Erreur'),
            );
          }
          client = snapshot.data!;
          setPageTitle(client.name!, context);
          return Responsive(
            mobile: Scaffold(
              key: Key(client.name! + client.zipcode!),
              drawer: const SideMenu(),
              appBar: AppBar(
                title: Text(client.name!),
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
              body: DetailClient(client: client),
            ),
            desktop: Scaffold(
              key: ValueKey(client.name! + client.zipcode!),
              drawer: const SideMenu(),
              body: SafeArea(
                  child: Row(
                children: [
                  const Expanded(
                    child: SideMenu(),
                  ),
                  Expanded(
                    flex: 5,
                    child: DetailClient(client: client),
                  )
                ],
              )),
            ),
          );
        });
  }
}
