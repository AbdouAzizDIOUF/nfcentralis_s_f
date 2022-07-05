import 'package:flutter/material.dart';
import 'package:nfcentralis/components/already_have_an_account_check.dart';
import 'package:nfcentralis/components/rounded_button.dart';

class Content extends StatelessWidget {
  const Content({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundedButton(
            text: "CONNEXION",
            press: () {
              Navigator.pushReplacementNamed(context, '/login');
            }),
        AlreadyHaveAnAccountCheck(
          press: () {
            Navigator.pushReplacementNamed(context, '/sign-up');
          },
        ),
      ],
    );
  }
}
