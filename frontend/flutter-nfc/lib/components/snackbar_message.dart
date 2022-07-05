import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class SnackBarMessage extends StatelessWidget {
  final String message;
  final ContentType contentType;
  const SnackBarMessage(
      {Key? key, required this.message, required this.contentType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AwesomeSnackbarContent(
      title: contentType == ContentType.success
          ? "Succès"
          : contentType == ContentType.warning
              ? "Attention"
              : contentType == ContentType.help
                  ? "Conseil"
                  : "Erreur",
      message: message,
      contentType: contentType,
    );
  }
}
