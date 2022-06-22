import 'package:flutter/material.dart';

const primaryColor = Color(0xffc43990);
const primaryColorLight = Color(0xFFECB4D8);
const thirdColor = Color(0xFFFD5E3D);
const thirdColorLight = Color(0xFFE6A99D);
const secondaryColor = Color(0xFF3D2A3E);

const backgroundColor = Color(0xff192028);

const defaultPadding = 16.0;

final RegExp emailValidatorRegEx = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp phoneNumberValidatorRegEx =
    RegExp(r"^(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}");

const String requiredFieldError = "Elément requis";
const String invalidEmailError = "Entrez un email valide";
const String invalidPhoneNumberError = "Entrez un numéro valide";
const String shortPassswordError =
    "Le mot de passe doit contenir au moins 8 caractères";
const String matchPasswordError = "Les mots de passe sont différents";
