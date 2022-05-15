import 'package:flutter/material.dart';
import 'package:nfcentralis/models/user.dart';
import 'package:nfcentralis/screens/splashscreen_wrapper.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/Authentication.dart';
import 'config/config.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final configurations = Configurations();
  await Firebase.initializeApp(
    options:  FirebaseOptions(
        apiKey: configurations.apiKey,
        appId: configurations.appId,
        messagingSenderId: configurations.messagingSenderId,
        projectId: configurations.projectId));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: AuthenticationService().user,
      initialData: null,
      child: MaterialApp(
        home: SplashScreenWrapper(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}