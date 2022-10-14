import 'package:flutter/material.dart';
import 'package:jumia_auth/common/widgets/custom_textfield.dart';
import 'package:jumia_auth/common/widgets/custon_button.dart';
import 'package:jumia_auth/constants/global_variables.dart';
import 'package:jumia_auth/features/auth/email/auth_email.dart';

class EmailSignup extends StatefulWidget {
  static const routeName = '/emailsignup';
  final String authEmail;
  const EmailSignup({required this.authEmail});

  @override
  State<EmailSignup> createState() => _EmailSignupState();
}

class _EmailSignupState extends State<EmailSignup> {
  final TextEditingController _passwordcontroller = TextEditingController();

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
                      'Create your account',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Let\'s get started by creating your account.\n To keep your account safe, we need a strong password',
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
                    IdentityContainer(
                        identityInfo: widget.authEmail,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuthEmailScreen()),
                          );
                        }),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                        controller: _passwordcontroller, hintText: 'Password'),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                        controller: _passwordcontroller,
                        hintText: 'Confirm Password'),
                    SizedBox(
                      height: 30,
                    ),
                    CustomButton(onTap: () {}, text: 'Continue'),
                    SizedBox(
                      height: 10,
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
