import 'package:flutter/material.dart';
import 'package:nfcentralis/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      width: size.width * 0.7,
      decoration: BoxDecoration(
        color: primaryColorLight,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
