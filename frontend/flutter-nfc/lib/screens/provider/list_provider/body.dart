import 'package:flutter/material.dart';
import 'package:nfcentralis/components/admin/admin_company_card.dart';
import 'package:nfcentralis/components/header.dart';
import 'package:nfcentralis/components/search_widget.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/models_test_debug_solo/company.dart';
import 'package:nfcentralis/responsive.dart';

class ListProvider extends StatefulWidget {
  const ListProvider({Key? key}) : super(key: key);

  @override
  ListProviderState createState() => ListProviderState();
}

class ListProviderState extends State<ListProvider> {
  late List companyListFiltered;
  String query = '';

  @override
  void initState() {
    super.initState();

    companyListFiltered = companyList;
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
              const Header(title: "Liste des prestataires"),
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
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(8),
                        separatorBuilder: (BuildContext context, i) =>
                            const SizedBox(height: defaultPadding),
                        itemCount: companyListFiltered.length,
                        itemBuilder: (BuildContext context, index) {
                          final company = companyListFiltered[index];

                          return buildCompany(company);
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

  Widget buildCompany(Company company) => AdminCompanyCard(
        name: company.name!,
        description: company.description!,
        logo: company.logo!,
        adress: company.adress!,
        city: company.city!,
        zipcode: company.zipcode!,
        press: () {
          Navigator.pushNamed(context, '/detail-provider', arguments: company);
        },
        //pressDelete: () {},
        //pressEdit: () {}
      );

  void filterList(String query) {
    final list = companyList.where((c) {
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
