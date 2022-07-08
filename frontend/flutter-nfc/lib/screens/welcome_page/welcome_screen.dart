import 'package:flutter/material.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/screens/welcome_page/components/body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString("token");
    if (val != null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/dashboard', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    setPageTitle('Bienvenue', context);
    return const Scaffold(
      body: Body(),
    );
  }
}
