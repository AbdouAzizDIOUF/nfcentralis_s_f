import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(child: Image.asset("assets/logo/logo_NFC_hor.png")),
        DrawerListTile(
          title: "Tableau de bord",
          svgSrc: "assets/icons/dashboard.svg",
          press: () {
            Navigator.pushNamed(context, '/dashboard');
          },
        ),
        DrawerListTile(
          title: "Interventions",
          svgSrc: "assets/icons/clipboard.svg",
          press: () {
            Navigator.pushNamed(context, '/list-intervention');
          },
        ),
        DrawerListTile(
          title: "Installations",
          svgSrc: "assets/icons/dashboard.svg",
          press: () {
            Navigator.pushNamed(context, '/list-installation');
          },
        ),
        DrawerListTile(
          title: "Donneur d'ordres",
          svgSrc: "assets/icons/building.svg",
          press: () {
            Navigator.pushNamed(context, '/list-orderer');
          },
        ),
        DrawerListTile(
          title: "Prestataires",
          svgSrc: "assets/icons/building.svg",
          press: () {
            Navigator.pushNamed(context, '/list-provider');
          },
        ),
        DrawerListTile(
          title: "Clients",
          svgSrc: "assets/icons/building.svg",
          press: () {
            Navigator.pushNamed(context, '/list-client');
          },
        ),
        DrawerListTile(
          title: "Profil",
          svgSrc: "assets/icons/user.svg",
          press: () {
            Navigator.pushNamed(context, '/detail-user', arguments: 1);
          },
        ),
        DrawerListTile(
          title: "Employé(e)s",
          svgSrc: "assets/icons/members.svg",
          press: () {
            Navigator.pushNamed(context, '/admin/list-utilisateurs');
          },
        ),
        DrawerListTile(
          title: "Déconnexion",
          svgSrc: "assets/icons/logout.svg",
          press: () {
            Navigator.pushNamed(context, '/welcome');
          },
        ),
      ],
    ));
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(title, style: const TextStyle(color: Colors.white54)),
    );
  }
}
