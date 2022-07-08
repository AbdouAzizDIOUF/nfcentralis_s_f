import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  SideMenuState createState() => SideMenuState();
}

class SideMenuState extends State<SideMenu> {
  late String role = "";
  late int userId = -1;

  @override
  void initState() {
    super.initState();
    getCred();
  }

  void getCred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      role = pref.getString("role") ?? "";
      userId = pref.getInt("id") ?? -1;
    });
  }

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
        if (role == 'ROLE_ADMIN')
          DrawerListTile(
            title: "Interventions",
            svgSrc: "assets/icons/clipboard.svg",
            press: () {
              Navigator.pushNamed(context, '/list-intervention');
            },
          ),
        if (role == 'ROLE_ADMIN' || role == 'ROLE_CHEF')
          DrawerListTile(
            title: "Installations",
            svgSrc: "assets/icons/dashboard.svg",
            press: () {
              Navigator.pushNamed(context, '/list-installation');
            },
          ),
        if (role == 'ROLE_ADMIN' || role == 'ROLE_CHEF')
          DrawerListTile(
            title: "Donneur d'ordres",
            svgSrc: "assets/icons/building.svg",
            press: () {
              Navigator.pushNamed(context, '/list-orderer');
            },
          ),
        if (role == 'ROLE_ADMIN' || role == 'ROLE_CHEF')
          DrawerListTile(
            title: "Prestataires",
            svgSrc: "assets/icons/building.svg",
            press: () {
              Navigator.pushNamed(context, '/list-provider');
            },
          ),
        if (role == 'ROLE_ADMIN' || role == 'ROLE_CHEF')
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
        if (role == 'ROLE_ADMIN' || role == 'ROLE_CHEF')
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
          press: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            await pref.clear();
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/welcome', (route) => false);
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
