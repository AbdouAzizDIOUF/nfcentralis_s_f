import 'package:flutter/material.dart';
import 'package:nfcentralis/constants.dart';

class CompanyCard extends StatelessWidget {
  final String? name, adress, city, zipcode, description, logo;
  final VoidCallback? press;

  const CompanyCard(
      {Key? key,
      this.name,
      this.adress,
      this.city,
      this.zipcode,
      this.description,
      this.logo,
      this.press})
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
