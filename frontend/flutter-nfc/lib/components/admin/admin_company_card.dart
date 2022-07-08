import 'package:flutter/material.dart';
import 'package:nfcentralis/constants.dart';

class AdminCompanyCard extends StatelessWidget {
  final String? name, adress, city, zipcode, description, logo;
  final VoidCallback? press, pressDelete, pressEdit;

  const AdminCompanyCard(
      {Key? key,
      this.name,
      this.adress,
      this.city,
      this.zipcode,
      this.description,
      this.logo,
      this.press,
      this.pressDelete,
      this.pressEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: secondaryColor,
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: press,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(alignment: Alignment.bottomLeft, children: [
                Ink.image(
                  height: 130,
                  image: NetworkImage(logo!),
                  fit: BoxFit.fitWidth,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(name!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                )
              ]),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                          children: [
                            const WidgetSpan(
                              child: Icon(Icons.description,
                                  color: Colors.white70, size: 18),
                            ),
                            TextSpan(text: description!),
                          ],
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white70,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                          )),
                    ),
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          const WidgetSpan(
                            child: Icon(Icons.location_city,
                                color: Colors.white70, size: 18),
                          ),
                          TextSpan(text: city!),
                        ],
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white70,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          children: [
                            const WidgetSpan(
                              child: Icon(Icons.location_on,
                                  color: Colors.white70, size: 18),
                            ),
                            TextSpan(text: adress! + ", " + zipcode!),
                          ],
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.white70,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic)),
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
    );
  }
}
