import 'package:flutter/material.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/controllers/menu_controller.dart';
import 'package:nfcentralis/screens/welcome_page/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MenuController(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'NFCentralis',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: backgroundColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white),
            canvasColor: secondaryColor,
          ),
          home: const WelcomeScreen()),
    );
  }
}
