import 'package:flutter/material.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/screens/welcome_page/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setPageTitle('Bienvenue', context);
    return const Scaffold(
      body: Body(),
    );
  }
}
