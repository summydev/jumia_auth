import 'package:flutter/material.dart';
import 'package:jumia_auth/common/widgets/custom_textfield.dart';
import 'package:jumia_auth/common/widgets/custon_button.dart';
import 'package:jumia_auth/constants/global_variables.dart';

class EmailSignin extends StatefulWidget {
  static const routeName= '/emailsignin';
 final String authEmail;
  const EmailSignin({required this.authEmail});


  @override
  State<EmailSignin> createState() => _EmailSigninState();
}

class _EmailSigninState extends State<EmailSignin> {
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
                      'Welcome back!!!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Log back into your jumia account',
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
                        identityInfo: widget.authEmail, onTap: () {}),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                        controller: _passwordcontroller, hintText: 'Password'),
                    SizedBox(
                      height: 40,
                    ),
                    CustomButton(onTap: () {}, text: 'Login'),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot your passsword?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 16,
                        ),
                      ),
                    ),
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
