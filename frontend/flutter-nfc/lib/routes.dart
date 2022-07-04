import 'package:flutter/material.dart';
import 'package:nfcentralis/screens/client/detail_client/screen.dart';
import 'package:nfcentralis/screens/client/list_client/screen.dart';
import 'package:nfcentralis/screens/installations/list_installations/screen.dart';
import 'package:nfcentralis/screens/interventions/list_interventions/screen.dart';
import 'package:nfcentralis/screens/login/login_screen.dart';
import 'package:nfcentralis/screens/orderer/detail_orderer/screen.dart';
import 'package:nfcentralis/screens/orderer/list_orderer/screen.dart';
import 'package:nfcentralis/screens/provider/list_provider/screen.dart';
import 'package:nfcentralis/screens/sign_up/sign_up_screen.dart';
import 'package:nfcentralis/screens/user/detail_user/screen.dart';
import 'package:nfcentralis/screens/user/list_user/screen.dart';
import 'package:nfcentralis/screens/welcome_page/welcome_screen.dart';

import 'screens/interventions/detail_intervention.dart/screen.dart';
import 'screens/main/main_screen.dart';
import 'screens/provider/detail_provider/screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case '/sign-up':
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case '/login':
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case '/welcome':
        return MaterialPageRoute(builder: (context) => const WelcomeScreen());
      case '/dashboard':
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case '/list-intervention':
        return MaterialPageRoute(
            builder: (context) => const ListInterventionScreen());
      case '/list-installation':
        return MaterialPageRoute(
            builder: (context) => const ListInstallationScreen());
      case '/list-orderer':
        return MaterialPageRoute(
            builder: (context) => const ListOrdererScreen());
      case '/list-provider':
        return MaterialPageRoute(
            builder: (context) => const ListProviderScreen());
      case '/list-client':
        return MaterialPageRoute(
            builder: (context) => const ListClientScreen());
      case '/admin/list-utilisateurs':
        return MaterialPageRoute(builder: (context) => const ListUserScreen());
      case '/detail-user':
        return MaterialPageRoute(
            builder: (context) => DetailUserScreen(
                  userId: args,
                ));
      case '/detail-provider':
        return MaterialPageRoute(
            builder: (context) => DetailProviderScreen(
                  companyId: args,
                ));
      case '/detail-orderer':
        return MaterialPageRoute(
            builder: (context) => DetailOrdererScreen(
                  companyId: args,
                ));

      case '/detail-client':
        return MaterialPageRoute(
            builder: (context) => DetailClientScreen(
                  companyId: args,
                ));

      case '/detail-intervention':
        return MaterialPageRoute(
            builder: (context) => DetailInterventionScreen(
                  interventionId: args,
                ));
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        body: Center(
          child: Text("Vous vous êtes perdu ?"),
        ),
      );
    });
  }
}
