import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreenImage extends StatelessWidget {
  const LoginScreenImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          children: [
            Expanded(
              flex: 8,
              child: SvgPicture.asset("assets/icons/login_illu.svg"),
            ),
          ],
        ),
      ],
    );
  }
}
