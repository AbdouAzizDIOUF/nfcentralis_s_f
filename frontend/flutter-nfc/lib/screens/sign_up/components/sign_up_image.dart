import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:nfcentralis/constants.dart';

class SignUpScreenImage extends StatelessWidget {
  const SignUpScreenImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SvgPicture.asset("assets/icons/sign_up_illu.svg"),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}
