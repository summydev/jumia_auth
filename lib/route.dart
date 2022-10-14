import 'package:flutter/material.dart';
import 'package:jumia_auth/features/auth/email/auth_email.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthEmailScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => AuthEmailScreen());

    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('error 404'),
                ),
              ));
  }
}
