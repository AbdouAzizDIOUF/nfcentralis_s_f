import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/responsive.dart';
// import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:flutter/material.dart';
import 'package:nfcentralis/screens/home/components/header.dart';

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
            const Header(),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      // MyFiles(),
                      const SizedBox(height: defaultPadding),
                      // RecentFiles(),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: defaultPadding),
                      // if (Responsive.isMobile(context)) StorageDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: defaultPadding),
                // if (!Responsive.isMobile(context))
                //   Expanded(
                //     flex: 2,
                //     child: StorageDetails(),
                //   ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
