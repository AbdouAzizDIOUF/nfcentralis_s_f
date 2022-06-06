import 'package:flutter/material.dart';
import 'package:nfcentralis/services/authentication.dart';
import 'package:nfcentralis/common/scaled_list.dart';
class HomeScreen extends StatelessWidget {
  final AuthenticationService _auth = AuthenticationService();

  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0.0 ,
        title: const Text('NFCentralis'),
        actions: <Widget>[
          TextButton.icon(onPressed: () async {
            await _auth.signOut();
          },
              icon: const Icon(Icons.person),
              label: const Text('logout'),
          )
        ],
      ),
     body: Center(
      child:  ScaledList(
       itemCount: categories.length,
        itemColor: (index) {
        return kMixedColors[index % kMixedColors.length];
      },
      itemBuilder: (index, selectedIndex) {
        final category = categories[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: selectedIndex == index ? 100 : 80,
              child: Image.asset(category.image),
            ),
            const SizedBox(height: 15),
            Text(
              category.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: selectedIndex == index ? 25 : 20),
            )
          ],
        );
      }, key: null,
    ),
    ),
    );
  }
  }


final List<Color> kMixedColors = [
  const Color(0xff71A5D7),
  const Color(0xff72CCD4),
  const Color(0xffFBAB57),
  const Color(0xffF8B993),
  const Color(0xff962D17),
  const Color(0xffc657fb),
  const Color(0xfffb8457),
];

final List<Category> categories = [
  Category(image: "assets/images/1.png", name: "Beef"),
  Category(image: "assets/images/2.png", name: "Chicken"),
  Category(image: "assets/images/3.png", name: "Dessert"),
  Category(image: "assets/images/4.png", name: "Lamb"),
  Category(image: "assets/images/5.png", name: "Pasta"),
];


class Category {
  final String image;
  final String name;

  Category({required this.image, required this.name});
}
