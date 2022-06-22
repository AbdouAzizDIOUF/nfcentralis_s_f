import 'package:flutter/material.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/components/background.dart';
import 'package:nfcentralis/screens/welcome_page/components/content.dart';
import 'package:nfcentralis/screens/welcome_page/components/welcome_image.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                  child: WelcomeImage(),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 450,
                      child: Content(),
                    )
                  ],
                ))
              ],
            ),
            mobile: const MobileWelcomeScreen(),
          ),
        ),
      ),
    );
  }
}

class MobileWelcomeScreen extends StatelessWidget {
  const MobileWelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const WelcomeImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(flex: 8, child: Content()),
            Spacer(),
          ],
        )
      ],
    );
  }
}
