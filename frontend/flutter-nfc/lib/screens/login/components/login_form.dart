import 'package:flutter/material.dart';
import 'package:nfcentralis/components/already_have_an_account_check.dart';
import 'package:nfcentralis/components/rounded_button.dart';
import 'package:nfcentralis/components/rounded_input_field.dart';
import 'package:nfcentralis/components/rounded_password_field.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/screens/main/main_screen.dart';
import 'package:nfcentralis/screens/sign_up/sign_up_screen.dart';
import 'package:nfcentralis/size_config.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? identifier, password;
  final List<String?> errors = [];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    setPageTitle('Connexion', context);
    return Form(
      key: _formKey,
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
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const MainScreen();
                    }));
                  }
                }),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SignUpScreen();
                }));
              },
            ),
          ]),
    );
  }
}
