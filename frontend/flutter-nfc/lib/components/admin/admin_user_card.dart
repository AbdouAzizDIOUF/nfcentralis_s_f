import 'package:flutter/material.dart';
import 'package:nfcentralis/constants.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class AdminUserCard extends StatelessWidget {
  final String firstName, lastName, email, userName, mobile;
  final String? role;
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
          children: [
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
            Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                      title: Text(role!,
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
                      children: [
                        ElevatedButton(
                          onPressed: pressEdit,
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return thirdColorLight;
                                }
                                return thirdColorLight; // Use the component's default.
                              })),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                // <-- Icon
                                Icons.edit,
                                color: Colors.black,
                                size: 24.0,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Éditer',
                                style: TextStyle(color: Colors.black),
                              ), // <-- Text
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                          onPressed: pressDelete,
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(29.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.redAccent;
                                }
                                return Colors
                                    .redAccent; // Use the component's default.
                              })),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                // <-- Icon
                                Icons.delete,
                                color: Colors.black,
                                size: 24.0,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Supprimer',
                                style: TextStyle(color: Colors.black),
                              ), // <-- Text
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
