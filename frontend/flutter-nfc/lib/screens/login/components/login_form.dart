import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:nfcentralis/components/already_have_an_account_check.dart';
import 'package:nfcentralis/components/rounded_button.dart';
import 'package:nfcentralis/components/rounded_input_field.dart';
import 'package:nfcentralis/components/rounded_password_field.dart';
import 'package:nfcentralis/components/snackbar_message.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:nfcentralis/size_config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKeyLogin = GlobalKey<FormState>();
  String? identifier, password;
  final List<String?> errors = [];
  var mailController = TextEditingController();
  var passController = TextEditingController();

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
              controller: mailController,
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
              controller: passController,
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
                  login();
                }),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.pushNamed(context, '/sign-up');
              },
            ),
          ]),
    );
  }

  void login() async {
    if (_formKeyLogin.currentState!.validate()) {
      var response = await http.post(Uri.parse('$dataUrl/api/auth/signin'),
          body: ({
            "username": mailController.text,
            "email": mailController.text,
            "password": passController.text,
          }));
      if (response.statusCode == 200) {
        final body = json.decode(utf8.decode(response.bodyBytes));

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: SnackBarMessage(
            title: 'Bienvenue',
            message: '',
            contentType: ContentType.success,
          ),
        ));
        pageRoute(body);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: SnackBarMessage(
            message: 'Mauvais Identifiant/Mot de passe',
            contentType: ContentType.failure,
          ),
        ));
      }
    }
  }

  void pageRoute(dynamic body) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("token", body['accessToken']);
    await pref.setString("firstName", body['firstName']);
    await pref.setString("lastName", body['lastName']);
    await pref.setString("role", body['roles'][0]);
    await pref.setInt("id", body['id']);
    Navigator.pushReplacementNamed(context, '/dashboard');
  }
}
