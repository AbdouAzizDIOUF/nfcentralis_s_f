import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:flutter/material.dart';
import 'package:nfcentralis/screens/companies/list_companies/body.dart';
import 'package:nfcentralis/components/header.dart';
import 'package:nfcentralis/screens/home/components/installation_plugin.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(title: "Tableau de bord"),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: defaultPadding),
                      const ListInstallationsPlugin(),
                      const ListCompanies(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
