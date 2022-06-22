import 'package:flutter/material.dart';
import 'package:nfcentralis/components/already_have_an_account_check.dart';
import 'package:nfcentralis/components/rounded_button.dart';
import 'package:nfcentralis/screens/login/login_screen.dart';
import 'package:nfcentralis/screens/sign_up/sign_up_screen.dart';

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
            press: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }))
                }),
        AlreadyHaveAnAccountCheck(
          press: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const SignUpScreen();
            }));
          },
        ),
      ],
    );
  }
}
