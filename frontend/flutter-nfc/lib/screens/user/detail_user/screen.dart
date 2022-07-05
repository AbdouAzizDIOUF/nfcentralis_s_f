// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:nfcentralis/components/loading_spinner.dart';
import 'package:nfcentralis/components/snackbar_message.dart';

import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/controllers/utilisateur_controller.dart';
import 'package:nfcentralis/models/utilisateur.dart';
import 'package:nfcentralis/repository/utilisateur_repository.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/screens/main/components/side_menu.dart';
import 'package:nfcentralis/screens/user/detail_user/body.dart';

class DetailUserScreen extends StatefulWidget {
  final dynamic userId;
  const DetailUserScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  DetailUserScreenState createState() => DetailUserScreenState();
}

class DetailUserScreenState extends State<DetailUserScreen> {
  late Utilisateur user;
  var userController = UtilisateurController(UtilisateurRepository());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Utilisateur>(
        future: userController.getUtilisateurById(widget.userId),
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
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: SnackBarMessage(
                message: "Erreur lors de l'acquisition de données",
                contentType: ContentType.failure,
              ),
            ));
            return const Center(
              child: Text('Erreur'),
            );
          }
          user = snapshot.data!;
          setPageTitle(user.lastName! + " " + user.firstName!, context);
          return Responsive(
              mobile: Scaffold(
                key: Key("Profil de " + user.lastName! + " " + user.firstName!),
                drawer: const SideMenu(),
                appBar: AppBar(
                  title: Text(user.lastName! + " " + user.firstName!),
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
                body: DetailUser(user: user),
              ),
              desktop: Scaffold(
                key: Key("Profil de " + user.lastName! + " " + user.firstName!),
                drawer: const SideMenu(),
                body: SafeArea(
                    child: Row(
                  children: [
                    const Expanded(
                      child: SideMenu(),
                    ),
                    Expanded(
                      flex: 5,
                      child: DetailUser(user: user),
                    )
                  ],
                )),
              ));
        });
  }
}
