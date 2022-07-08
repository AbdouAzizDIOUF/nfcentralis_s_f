import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/responsive.dart';

class Header extends StatefulWidget {
  final String title;
  const Header({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  HeaderState createState() => HeaderState();
}

class HeaderState extends State<Header> {
  String firstName = "";
  String lastName = "";

  @override
  void initState() {
    super.initState();
    getCred();
  }

  void getCred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      firstName = pref.getString("firstName") ?? "";
      lastName = pref.getString("lastName") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu)),
        if (!Responsive.isMobile(context))
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        // const Expanded(child: SearchField()),
        ProfileCard(lastName: lastName, firstName: firstName)
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String? firstName, lastName;
  const ProfileCard({
    Key? key,
    required this.lastName,
    required this.firstName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = lastName! + " " + firstName!;
    return Container(
      margin: const EdgeInsets.only(left: defaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      child: Row(children: [
        ProfilePicture(
          name: name,
          radius: 30,
          fontsize: 21,
          tooltip: true,
        ),
        if (!Responsive.isMobile(context))
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text(name)),
      ]),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            hintText: "Rechercher",
            fillColor: secondaryColor,
            filled: true,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            suffixIcon: InkWell(
              onTap: () {},
              child: Container(
                  padding: const EdgeInsets.all(defaultPadding * 0.75),
                  margin: const EdgeInsets.symmetric(
                      horizontal: defaultPadding / 2),
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SvgPicture.asset("assets/icons/bell-ring.svg")),
            )));
  }
}
