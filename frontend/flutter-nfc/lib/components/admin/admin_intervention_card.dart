import 'package:flutter/material.dart';
import 'package:nfcentralis/constants.dart';

class AdminInterventionCard extends StatelessWidget {
  final String? user, installation, name, status;
  final VoidCallback? press, pressDelete, pressEdit;
  const AdminInterventionCard(
      {Key? key,
      this.user,
      this.status,
      this.installation,
      this.name,
      this.press,
      this.pressDelete,
      this.pressEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: <Widget>[
        Card(
          color: secondaryColor,
          clipBehavior: Clip.antiAlias,
          elevation: 16,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: InkWell(
            onTap: press,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(alignment: Alignment.bottomLeft, children: [
                  Ink(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(name!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                          fontWeight: FontWeight.normal,
                        )),
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                            children: [
                              const WidgetSpan(
                                child: Icon(Icons.person,
                                    color: Colors.white70, size: 18),
                              ),
                              TextSpan(text: user!),
                            ],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                              fontWeight: FontWeight.normal,
                            )),
                      ),
                      RichText(
                        text: TextSpan(
                            children: [
                              const WidgetSpan(
                                child: Icon(Icons.location_on,
                                    color: Colors.white70, size: 18),
                              ),
                              TextSpan(text: installation!),
                            ],
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
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 15,
          right: 15,
          child: RichText(
            text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(
                        status! == "En Cours"
                            ? Icons.arrow_circle_up
                            : status! == "En Attente"
                                ? Icons.access_time
                                : Icons.task_alt,
                        color: status! == "En Cours"
                            ? Colors.orangeAccent
                            : status! == "En Attente"
                                ? Colors.redAccent
                                : Colors.greenAccent,
                        size: 20),
                  ),
                  TextSpan(text: " " + status!),
                ],
                style: TextStyle(
                  fontSize: 16,
                  color: status! == "En Cours"
                      ? Colors.orangeAccent
                      : status! == "En Attente"
                          ? Colors.redAccent
                          : Colors.greenAccent,
                  fontWeight: FontWeight.normal,
                )),
          ),
        ),
      ]),
    );
  }
}
