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
