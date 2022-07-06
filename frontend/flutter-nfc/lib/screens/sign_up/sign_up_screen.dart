import 'package:flutter/material.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/components/background.dart';
import 'package:nfcentralis/screens/sign_up/components/sign_up_form.dart';
import 'package:nfcentralis/screens/sign_up/components/sign_up_image.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setPageTitle('Inscription', context);
    return Background(
        key: const Key("Inscription"),
        child: SingleChildScrollView(
          child: Responsive(
            desktop: Row(children: [
              const Expanded(child: SignUpScreenImage()),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 450,
                      child: SignUpForm(),
                    ),
                    SizedBox(height: defaultPadding / 2),
                  ],
                ),
              )
            ]),
            mobile: const MobileSignupScreen(),
          ),
        ));
  }
}

class MobileSignupScreen extends StatelessWidget {
  const MobileSignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setPageTitle('Inscription', context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "INSCRIPTION",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white54, fontSize: 16),
        ),
        const Divider(
          color: Colors.white54,
          height: 20,
          indent: 50,
          endIndent: 50,
        ),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: SignUpForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
