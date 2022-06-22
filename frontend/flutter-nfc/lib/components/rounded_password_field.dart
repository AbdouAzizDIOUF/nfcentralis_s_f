import 'package:flutter/material.dart';
import 'package:nfcentralis/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String hintText;
  final void Function(String?)? onSaved;
  final FormFieldValidator<String>? validator;
  const RoundedPasswordField(
      {Key? key,
      this.onChanged,
      required this.hintText,
      this.onSaved,
      this.validator})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => RoundedPasswordFieldState();
}

class RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
          obscureText: isObscure,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          validator: widget.validator,
          decoration: InputDecoration(
            errorStyle: const TextStyle(
                fontSize: 14, color: thirdColor, fontWeight: FontWeight.normal),
            prefixIcon: const Icon(
              Icons.lock,
              color: primaryColor,
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
            border: InputBorder.none,
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off,
                  color: primaryColor),
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
