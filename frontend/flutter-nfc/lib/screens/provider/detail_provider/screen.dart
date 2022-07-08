// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nfcentralis/components/loading_spinner.dart';

import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/controllers/company_controller.dart';
import 'package:nfcentralis/models/company.dart';
import 'package:nfcentralis/repository/company_repository.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/screens/main/components/side_menu.dart';
import 'package:nfcentralis/screens/provider/detail_provider/body.dart';

class DetailProviderScreen extends StatefulWidget {
  final dynamic companyId;
  const DetailProviderScreen({
    Key? key,
    required this.companyId,
  }) : super(key: key);

  @override
  DetailProviderScreenState createState() => DetailProviderScreenState();
}

class DetailProviderScreenState extends State<DetailProviderScreen> {
  late Company company;
  var companyController = CompanyController(CompanyRepository());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Company>(
        future: companyController.getCompanyById(widget.companyId),
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
          company = snapshot.data!;
          setPageTitle(company.name!, context);
          return Responsive(
            mobile: Scaffold(
              key: Key(company.name! + company.zipcode!),
              drawer: const SideMenu(),
              appBar: AppBar(
                title: Text(company.name!),
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
              body: DetailProvider(company: company),
            ),
            desktop: Scaffold(
              key: ValueKey(company.name! + company.zipcode!),
              drawer: const SideMenu(),
              body: SafeArea(
                  child: Row(
                children: [
                  const Expanded(
                    child: SideMenu(),
                  ),
                  Expanded(
                    flex: 5,
                    child: DetailProvider(company: company),
                  )
                ],
              )),
            ),
          );
        });
  }
}
