import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/screens/main/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controllers/menu_controller.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

class _MyAppState extends State<MyApp>{
  final url = "https://jsonplaceholder.typicode.com/posts";
  var _postJson = [];

  void afficherClient() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postJson = jsonData;
      });
    } catch (err) {}
  }

  void iniState(){
    super.initState();
    afficherClient();
  }

  void insererClient() async {
    try {
      final response = await post(Uri.parse(url), body: {
        "Les éléments à entrer"});
    } catch (err) {}
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      body: ListView.builder(
      itemCount: _postJson.length,
      itemBuilder: (context,i){
        final post= _postJson[i];
        return Text ("id: ${post["id"]}\n "
            "adress: ${post["adress"]}\n "
            "city: ${post["city"]}\n "
            "email: ${post["email"]}\n "
            "logo: ${post["logo"]}\n "
            "name: ${post["name"]}\n "
            "phone: ${post["phone"]}\n "
            "zipcode: ${post["zipcode"]}\n\n");
        }
        ),
      ),

    );
  }
}
