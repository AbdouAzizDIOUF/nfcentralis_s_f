import 'package:flutter/material.dart';
import 'package:nfcentralis/components/admin/admin_installation_card.dart';
import 'package:nfcentralis/components/header.dart';
import 'package:nfcentralis/components/search_widget.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/models_test_debug_solo/installation.dart';
import 'package:nfcentralis/responsive.dart';

class ListInstallations extends StatefulWidget {
  const ListInstallations({Key? key}) : super(key: key);

  @override
  ListInstallationState createState() => ListInstallationState();
}

class ListInstallationState extends State<ListInstallations> {
  late List installationListFiltered;
  String query = '';

  @override
  void initState() {
    super.initState();

    installationListFiltered = installationList;
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
              const Header(title: "Liste des installations"),
            const SizedBox(),
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
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(8),
                        separatorBuilder: (BuildContext context, i) =>
                            const SizedBox(height: defaultPadding),
                        itemCount: installationListFiltered.length,
                        itemBuilder: (BuildContext context, index) {
                          final installation = installationListFiltered[index];

                          return buildCompany(installation, index + 1);
                        })
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildCompany(Installation installation, int index) =>
      AdminInstallationCard(
        name: "Installation" + index.toString(),
        image: installation.image!,
        adress: installation.adress!,
        city: installation.city!,
        zipcode: installation.zipcode!,
        press: () {},
        //pressDelete: () {},
        //pressEdit: () {}
      );

  void filterList(String query) {
    final list = installationList.where((i) {
      final nameLower = i.name.toLowerCase();
      final cityLower = i.city.toLowerCase();
      final zipcodeLower = i.zipcode.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower) ||
          cityLower.contains(searchLower) ||
          zipcodeLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      installationListFiltered = list;
    });
  }
}
