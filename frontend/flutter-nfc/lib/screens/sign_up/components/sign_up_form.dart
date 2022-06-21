import 'package:flutter/material.dart';
import 'package:nfcentralis/components/already_have_an_account_check.dart';
import 'package:nfcentralis/components/rounded_button.dart';
import 'package:nfcentralis/components/rounded_input_field.dart';
import 'package:nfcentralis/components/rounded_password_field.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/screens/login/login_screen.dart';
import 'package:nfcentralis/screens/main/main_screen.dart';
import 'package:nfcentralis/size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email,
      password,
      confirmPassword,
      firstname,
      lastname,
      number,
      username;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundedInputField(
              hintext: "Nom",
              type: TextInputType.name,
              icon: Icons.person,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  return;
                }
              },
              onSaved: (newValue) => firstname = newValue,
              validator: (value) {
                if (value!.isEmpty) {
                  return requiredFieldError;
                }
                return null;
              },
            ),
            RoundedInputField(
              hintext: "Prénom",
              type: TextInputType.name,
              icon: Icons.person,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  return;
                }
              },
              onSaved: (newValue) => lastname = newValue,
              validator: (value) {
                if (value!.isEmpty) {
                  return requiredFieldError;
                }
                return null;
              },
            ),
            RoundedInputField(
              hintext: "Nom d'utilisateur",
              type: TextInputType.name,
              icon: Icons.alternate_email,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  return;
                }
              },
              onSaved: (newValue) => username = newValue,
              validator: (value) {
                if (value!.isEmpty) {
                  return requiredFieldError;
                }
                return null;
              },
            ),
            RoundedInputField(
              hintext: "Email",
              type: TextInputType.emailAddress,
              icon: Icons.email,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  return;
                } else if (emailValidatorRegEx.hasMatch(value)) {
                  return;
                }
              },
              onSaved: (newValue) => email = newValue,
              validator: (value) {
                if (value!.isEmpty) {
                  return requiredFieldError;
                } else if (!emailValidatorRegEx.hasMatch(value)) {
                  return invalidEmailError;
                }
                return null;
              },
            ),
            RoundedInputField(
              hintext: "Numéro",
              type: TextInputType.number,
              icon: Icons.phone_android,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  return;
                } else if (phoneNumberValidatorRegEx.hasMatch(value)) {
                  return;
                }
              },
              onSaved: (newValue) => number = newValue,
              validator: (value) {
                if (value!.isEmpty) {
                  return requiredFieldError;
                } else if (!phoneNumberValidatorRegEx.hasMatch(value)) {
                  return invalidPhoneNumberError;
                }
                return null;
              },
            ),
            RoundedPasswordField(
              hintText: "Mot de passe",
              onSaved: (newValue) => password = newValue,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  return;
                } else if (value.length >= 8) {
                  return;
                }
              },
              validator: (value) {
                password = value;
                if (value!.isEmpty) {
                  return requiredFieldError;
                } else if (value.length < 8) {
                  return shortPassswordError;
                }
                return null;
              },
            ),
            RoundedPasswordField(
              hintText: "Confirmer mot de passe",
              onSaved: (newValue) => confirmPassword = newValue,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  return;
                } else if (value.isNotEmpty && password == confirmPassword) {
                  return;
                }
                confirmPassword = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return requiredFieldError;
                } else if ((password != value)) {
                  return matchPasswordError;
                }
                return null;
              },
            ),
            RoundedButton(
                text: "INSCRIPTION",
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
              login: false,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }));
              }, // Navigator.pushReplacement quand y'aura le login et l'inscription de valide.
            ),
          ]),
    );
  }
}
