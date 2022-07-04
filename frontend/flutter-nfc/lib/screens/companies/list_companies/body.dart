import 'package:flutter/material.dart';
import 'package:nfcentralis/components/company_card.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/models_test_debug_solo/company.dart';

class ListCompanies extends StatefulWidget {
  const ListCompanies({Key? key}) : super(key: key);

  @override
  ListCompaniesState createState() => ListCompaniesState();
}

class ListCompaniesState extends State<ListCompanies> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: defaultPadding),
          for (var i = 0; i < 5; i++)
            CompanyCard(
              name: companyList[i].name,
              description: companyList[i].description,
              logo: companyList[i].logo,
              adress: companyList[i].adress,
              city: companyList[i].city,
              zipcode: companyList[i].zipcode,
              press: () {},
            ),
        ],
      ),
    );
  }
}
