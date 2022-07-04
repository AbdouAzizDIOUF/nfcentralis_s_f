import 'package:flutter/material.dart';
import 'package:nfcentralis/constants.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class AdminUserCard extends StatelessWidget {
  final String firstName, lastName, email, userName, mobile, role;
  final VoidCallback press, pressDelete, pressEdit;

  const AdminUserCard(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.userName,
      required this.mobile,
      required this.role,
      required this.press,
      required this.pressDelete,
      required this.pressEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondaryColor,
      clipBehavior: Clip.antiAlias,
      elevation: 16,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: press,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: ProfilePicture(
                name: lastName + " " + firstName,
                role: role,
                radius: 31,
                fontsize: 21,
                tooltip: true,
              ),
              title: Text(lastName.toUpperCase() + " " + firstName,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            ListTile(
              leading: const Icon(
                Icons.email,
                color: Colors.white70,
              ),
              title: Text(email,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.normal,
                  )),
            ),
            ListTile(
              leading: const Icon(
                Icons.call,
                color: Colors.white70,
              ),
              title: Text(mobile,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.normal,
                  )),
            ),
            ListTile(
              leading: const Icon(
                Icons.shield,
                color: Colors.white70,
              ),
              title: Text(role,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.normal,
                  )),
            ),
            const Divider(
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Icon(Icons.delete,
                      color: Colors.redAccent, size: 20),
                  onPressed: pressDelete,
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Icon(Icons.edit,
                      color: Colors.yellowAccent, size: 20),
                  onPressed: pressEdit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
