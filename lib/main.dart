import 'package:flutter/material.dart';
import 'package:jumia_auth/features/auth/email/auth_email.dart';
import 'package:jumia_auth/features/auth/email/email_signup.dart';
import 'package:jumia_auth/features/profile/morepersonaldetails.dart';
import 'package:jumia_auth/features/profile/personal_details_screen.dart';
import 'package:jumia_auth/providers/user_provider.dart';
import 'package:jumia_auth/route.dart';
import 'package:jumia_auth/features/auth/email/auth_email.dart';
import 'package:provider/provider.dart';
import 'constants/global_variables.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jumia',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme:
              ColorScheme.light(primary: GlobalVariables.secondaryColor),
          appBarTheme: AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
      onGenerateRoute: (settings) => generateRoute(settings),
      //initialRoute: '/',
      home:
          //more
          AuthEmailScreen(),
      // routes: {
      //   '/': (context) => AuthEmailScreen(),
      //   '/api/email/signup': (context) => EmailSignup(
      //         authEmail: 'hello@hi.com',
      //       )
      // },
    );
  }
}
