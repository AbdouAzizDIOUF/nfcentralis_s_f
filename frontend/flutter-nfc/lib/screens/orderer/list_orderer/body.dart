import 'package:flutter/material.dart';
import 'package:nfcentralis/components/company_card.dart';
import 'package:nfcentralis/components/header.dart';
import 'package:nfcentralis/components/loading_spinner.dart';
import 'package:nfcentralis/components/search_widget.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/controllers/company_controller.dart';
import 'package:nfcentralis/models/company.dart';
import 'package:nfcentralis/repository/company_repository.dart';
import 'package:nfcentralis/responsive.dart';

class ListOrderer extends StatefulWidget {
  const ListOrderer({Key? key}) : super(key: key);

  @override
  ListOrdererState createState() => ListOrdererState();
}

class ListOrdererState extends State<ListOrderer> {
  late List companyListFiltered;
  late List companyListFull;
  String query = '';
  int loaded = 0;
  var providerController = CompanyController(CompanyRepository());

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
              const Header(title: "Liste des donneurs d'ordres"),
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
                    FutureBuilder<List>(
                        future: providerController.fetchCompanieOrdererList(),
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
                          companyListFiltered = snapshot.data!;
                          companyListFull = snapshot.data!;
                          return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(8),
                              separatorBuilder: (BuildContext context, i) =>
                                  const SizedBox(height: defaultPadding),
                              itemCount: companyListFiltered.length,
                              itemBuilder: (BuildContext context, index) {
                                final company = companyListFiltered[index];

                                return buildCompany(company);
                              });
                        }),
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildCompany(Company company) => CompanyCard(
        name: company.name!,
        description: company.description!,
        logo: company.logo!,
        adress: company.adress!,
        city: company.city!,
        zipcode: company.zipcode!,
        press: () {
          Navigator.pushNamed(context, '/detail-orderer',
              arguments: company.id);
        },
        //pressDelete: () {},
        //pressEdit: () {}
      );

  void filterList(String query) {
    final list = companyListFull.where((c) {
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
      companyListFiltered = list;
    });
  }
}
