import 'package:flutter/material.dart';
import '../constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? 'Pas de compte ? ' : "Déjà inscrit(e) ? ",
          style: const TextStyle(color: primaryColorLight),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "S'inscrire" : "S'identifier",
            style: const TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
