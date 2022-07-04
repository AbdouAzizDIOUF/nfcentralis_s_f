import 'package:flutter/material.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/controllers/menu_controller.dart';
import 'package:nfcentralis/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const NFCentralisApp());
}

class NFCentralisApp extends StatefulWidget {
  const NFCentralisApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NFCentralisAppState();
}

class NFCentralisAppState extends State<NFCentralisApp> {
  @override
  void initState() {
    super.initState();
  }

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
        initialRoute: '/welcome',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
