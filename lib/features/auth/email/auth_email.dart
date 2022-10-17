import 'package:flutter/material.dart';
import 'package:jumia_auth/common/widgets/custom_textfield.dart';
import 'package:jumia_auth/common/widgets/custon_button.dart';
import 'package:jumia_auth/constants/global_variables.dart';
import 'package:jumia_auth/features/auth/email/email_login.dart';
import 'package:jumia_auth/features/auth/email/email_signup.dart';
import 'package:jumia_auth/features/services/auth_services.dart';

class AuthEmailScreen extends StatefulWidget {
  static const routeName = '/authemail';
  const AuthEmailScreen({Key? key}) : super(key: key);

  @override
  State<AuthEmailScreen> createState() => _AuthEmailScreenState();
}

class _AuthEmailScreenState extends State<AuthEmailScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  late final String authEmail = _emailcontroller.text;
  AuthService authService = AuthService();

  void checkUser() {
    authService.checkUserExists(context: context, email: _emailcontroller.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Image.asset(
                      'images/jumialogo.png',
                      width: 70,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'What\'s your email address?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Type your email to log in or create a jumia account.',
                      style: TextStyle(
                        fontSize: 16,

                        color: GlobalVariables.greyBackgroundCOlor,
                        // fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomTextField(
                        controller: _emailcontroller, hintText: 'Email'),
                    SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                        onTap: () async {
                          checkUser();
                          print('pressed');
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => EmailSignup(
                          //             authEmail: authEmail,
                          //           )),
                          // );
                        },
                        text: 'Continue'),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Log in or register with phone number',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    CustomButtonB(onTap: () {}, text: 'Log in with Facebook'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'For further support you may visit the Help Center or contact our customer service team',
                      textAlign: TextAlign.center,
                      style: TextStyle(height: 1.4),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'images/Jumia-Logo.png',
                      width: 100,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
