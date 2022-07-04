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
        Row(
          children: [
            Expanded(
              flex: 8,
              child: SvgPicture.asset("assets/icons/sign_up_illu.svg"),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}
