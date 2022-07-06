import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:nfcentralis/components/installation_card.dart';
import 'package:nfcentralis/components/snackbar_message.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/models_test_debug_solo/installation.dart';

class ListInstallationsPlugin extends StatefulWidget {
  const ListInstallationsPlugin({Key? key}) : super(key: key);

  @override
  ListInstallationPluginState createState() => ListInstallationPluginState();
}

class ListInstallationPluginState extends State<ListInstallationsPlugin> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: defaultPadding),
          for (var i = 0; i < 5; i++)
            InstallationCard(
              name: "Installation " + (i + 1).toString(),
              image: installationList[i].image,
              adress: installationList[i].adress,
              city: installationList[i].city,
              zipcode: installationList[i].zipcode,
              press: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: SnackBarMessage(
                    message: 'Test',
                    contentType: ContentType.success,
                  ),
                ));
              },
            ),
        ],
      ),
    );
  }
}
