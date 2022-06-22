import 'package:flutter/material.dart';
import 'package:nfcentralis/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.inkDrop(
        color: primaryColor,
        size: 100,
      ),
    );
  }
}
