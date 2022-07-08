// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nfcentralis/models/client.dart';

class DetailClient extends StatefulWidget {
  final Client client;
  const DetailClient({
    Key? key,
    required this.client,
  }) : super(key: key);

  @override
  DetailClientState createState() => DetailClientState();
}

class DetailClientState extends State<DetailClient> {
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
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset("assets/logo/logo_NFC_hor.png"),
              ),
              const SizedBox(
                height: 40,
              ),
              ListTile(
                leading: const Icon(
                  Icons.location_city,
                  color: Colors.white70,
                ),
                title: SelectableText(widget.client.name!,
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
                title: SelectableText(widget.client.email!,
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
                title: SelectableText(widget.client.city!,
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
                    widget.client.adress! + ", " + widget.client.zipcode!,
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
                title: SelectableText(widget.client.phone!,
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
