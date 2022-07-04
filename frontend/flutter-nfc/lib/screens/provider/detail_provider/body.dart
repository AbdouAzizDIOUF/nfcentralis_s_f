// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nfcentralis/models_test_debug_solo/company.dart';

class DetailProvider extends StatefulWidget {
  final Company company;
  const DetailProvider({
    Key? key,
    required this.company,
  }) : super(key: key);

  @override
  DetailProviderState createState() => DetailProviderState();
}

class DetailProviderState extends State<DetailProvider> {
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
                child: Image.asset(
                  widget.company.logo!,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 10))
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ListTile(
                leading: const Icon(
                  Icons.location_city,
                  color: Colors.white70,
                ),
                title: SelectableText(widget.company.name!,
                    style: const TextStyle(
                      fontSize: 16,
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
                title: SelectableText(widget.company.email!,
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
                  Icons.location_city,
                  color: Colors.white70,
                ),
                title: SelectableText(widget.company.city!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                    )),
                subtitle: const Text("Ville",
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                    )),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.location_on,
                  color: Colors.white70,
                ),
                title: SelectableText(
                    widget.company.adress! + ", " + widget.company.zipcode!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                    )),
                subtitle: const Text("Adresse",
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                    )),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.call,
                  color: Colors.white70,
                ),
                title: SelectableText(widget.company.phone!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                    )),
                subtitle: const Text("Téléphone",
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
