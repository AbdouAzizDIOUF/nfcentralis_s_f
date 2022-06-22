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
          press: () {},
        ),
        DrawerListTile(
          title: "Profil",
          svgSrc: "assets/icons/user.svg",
          press: () {},
        ),
        DrawerListTile(
          title: "Employé(e)s",
          svgSrc: "assets/icons/members.svg",
          press: () {},
        ),
        DrawerListTile(
          title: "Aide",
          svgSrc: "assets/icons/help.svg",
          press: () {},
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
