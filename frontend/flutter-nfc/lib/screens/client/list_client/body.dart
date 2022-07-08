import 'package:flutter/material.dart';
import 'package:nfcentralis/components/company_card.dart';
import 'package:nfcentralis/components/loading_spinner.dart';
import 'package:nfcentralis/components/search_widget.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/controllers/client_controller.dart';
import 'package:nfcentralis/components/header.dart';
import 'package:nfcentralis/models/client.dart';
import 'package:nfcentralis/repository/client_repository.dart';
import 'package:nfcentralis/responsive.dart';

class ListClient extends StatefulWidget {
  const ListClient({Key? key}) : super(key: key);

  @override
  ListClientState createState() => ListClientState();
}

class ListClientState extends State<ListClient> {
  late List clientListFiltered = [];
  late List clientListFull = [];
  String query = '';
  int loaded = 0;
  var clientController = ClientController(ClientRepository());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            if (Responsive.isDesktop(context))
              const Header(title: "Liste des clients"),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: [
                      SearchWidget(
                          text: query,
                          onChanged: filterList,
                          hintText: "Rechercher"),
                      FutureBuilder<List>(
                          future: clientController.fetchClientList(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.waiting &&
                                loaded == 0) {
                              return Column(
                                children: const [
                                  SizedBox(height: defaultPadding),
                                  Center(child: LoadingSpinner()),
                                ],
                              );
                            }
                            loaded += 1;
                            if (snapshot.hasError) {
                              return const Center(child: Text('error'));
                            }
                            clientListFiltered = snapshot.data!;
                            clientListFull = snapshot.data!;
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(8),
                              separatorBuilder: (BuildContext context, i) =>
                                  const SizedBox(height: defaultPadding),
                              itemCount: clientListFiltered.length,
                              itemBuilder: (BuildContext context, index) {
                                final client = clientListFiltered[index];

                                return buildCompany(client);
                              },
                            );
                          }),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildCompany(Client client) => CompanyCard(
        name: client.name!,
        description: client.description!,
        logo: "assets/logo/logo_NFC_hor.png",
        adress: client.adress!,
        city: client.city!,
        zipcode: client.zipcode!,
        press: () {
          Navigator.pushNamed(context, '/detail-client', arguments: client.id);
        },
        //pressDelete: () {},
        //pressEdit: () {}
      );

  void filterList(String query) {
    final list = clientListFull.where((c) {
      final nameLower = c.name.toLowerCase();
      final cityLower = c.city.toLowerCase();
      final zipcodeLower = c.zipcode.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower) ||
          cityLower.contains(searchLower) ||
          zipcodeLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      clientListFiltered = list;
    });
  }
}
