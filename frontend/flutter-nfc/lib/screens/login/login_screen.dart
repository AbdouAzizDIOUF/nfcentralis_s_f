import 'package:flutter/material.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/components/background.dart';
import 'package:nfcentralis/screens/login/components/login_form.dart';
import 'package:nfcentralis/screens/login/components/login_screen_image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setPageTitle('Connexion', context);
    return Background(
        child: SingleChildScrollView(
      child: Responsive(
        desktop: Row(
          children: [
            const Expanded(child: LoginScreenImage()),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 450,
                  child: LoginForm(),
                )
              ],
            ))
          ],
        ),
        mobile: const MobileLoginScreen(),
      ),
    ));
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setPageTitle('Connexion', context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "CONNEXION",
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
              child: LoginForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
