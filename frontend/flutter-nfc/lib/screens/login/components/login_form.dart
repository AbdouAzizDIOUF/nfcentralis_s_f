import 'package:flutter/material.dart';
import 'package:nfcentralis/components/already_have_an_account_check.dart';
import 'package:nfcentralis/components/rounded_button.dart';
import 'package:nfcentralis/components/rounded_input_field.dart';
import 'package:nfcentralis/components/rounded_password_field.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/size_config.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKeyLogin = GlobalKey<FormState>();
  String? identifier, password;
  final List<String?> errors = [];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    setPageTitle('Connexion', context);
    return Form(
      key: _formKeyLogin,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundedInputField(
              hintext: "Email / Nom d'utilisateur*",
              type: TextInputType.emailAddress,
              icon: Icons.email,
              onSaved: (newValue) => identifier = newValue,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  return;
                }
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return requiredFieldError;
                }
                return null;
              },
            ),
            RoundedPasswordField(
              hintText: "Mot de passe*",
              onSaved: (newValue) => identifier = newValue,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  return;
                }
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return requiredFieldError;
                }
                return null;
              },
            ),
            RoundedButton(
                text: "CONNEXION",
                press: () async {
                  if (_formKeyLogin.currentState!.validate()) {
                    _formKeyLogin.currentState!.save();
                    Navigator.pushReplacementNamed(context, '/dashboard');
                  }
                }),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.pushNamed(context, '/sign-up');
              },
            ),
          ]),
    );
  }
}
