// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

import 'package:nfcentralis/models_test_debug_solo/user.dart';

class DetailUser extends StatefulWidget {
  final User user;
  const DetailUser({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  DetailUserState createState() => DetailUserState();
}

class DetailUserState extends State<DetailUser> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Container(
                width: 100,
                height: 100,
                child: ProfilePicture(
                    fontsize: 21,
                    name: widget.user.lastName! + " " + widget.user.firstName!,
                    radius: 31),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 4,
                      color: Theme.of(context).scaffoldBackgroundColor),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 10))
                  ],
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.white70,
                ),
                title: SelectableText(
                    widget.user.lastName!.toUpperCase() +
                        "\n" +
                        widget.user.firstName!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                    )),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.alternate_email,
                  color: Colors.white70,
                ),
                title: SelectableText(widget.user.userName!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                    )),
                subtitle: const Text("Nom d'utilisateur",
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                    )),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.email,
                  color: Colors.white70,
                ),
                title: SelectableText(widget.user.email!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                    )),
                subtitle: const Text("Email",
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                    )),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.phone_android,
                  color: Colors.white70,
                ),
                title: SelectableText(widget.user.mobile!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                    )),
                subtitle: const Text("Mobile",
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
