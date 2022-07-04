import 'package:flutter/material.dart';

import 'package:nfcentralis/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintext;
  final IconData icon;
  final TextInputType type;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final void Function(String?)? onSaved;
  final FormFieldValidator<String>? validator;
  const RoundedInputField({
    Key? key,
    required this.hintext,
    required this.icon,
    required this.type,
    this.controller,
    this.onChanged,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 48,
        decoration: BoxDecoration(
          color: primaryColorLight,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              blurRadius: 1.1,
              color: thirdColor,
              spreadRadius: 0.5,
              offset: Offset(
                1.5,
                2,
              ),
            ),
          ],
        ),
      ),
      TextFormField(
        style: const TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),
        keyboardType: type,
        controller: controller,
        onSaved: onSaved,
        validator: validator,
        textInputAction: TextInputAction.next,
        cursorColor: primaryColor,
        onChanged: onChanged,
        decoration: InputDecoration(
          errorStyle: const TextStyle(
              fontSize: 14, color: thirdColor, fontWeight: FontWeight.normal),
          prefixIcon: Icon(
            icon,
            color: primaryColor,
          ),
          hintText: hintext,
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
      ),
    ]);
  }
}
