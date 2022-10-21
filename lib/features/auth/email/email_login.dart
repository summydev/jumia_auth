import 'package:flutter/material.dart';
import 'package:jumia_auth/common/widgets/custom_textfield.dart';
import 'package:jumia_auth/common/widgets/custon_button.dart';
import 'package:jumia_auth/constants/global_variables.dart';
import 'package:jumia_auth/features/auth/email/auth_email.dart';
import 'package:jumia_auth/features/services/auth_services.dart';

class EmailSignin extends StatefulWidget {
  static const routeName = '/emailsignin';
  final String authEmail;
  const EmailSignin({required this.authEmail});

  @override
  State<EmailSignin> createState() => _EmailSigninState();
}

class _EmailSigninState extends State<EmailSignin> {
  final TextEditingController _passwordcontroller = TextEditingController();
  final _signInFormKey = GlobalKey<FormState>();
  AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.authEmail);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordcontroller.dispose();
  }

  void SignUserIn() {
    authService.signInUser(
        context: context,
        email: widget.authEmail,
        password: _passwordcontroller.text);
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
                      'Welcome back!!!',
                      style: GlobalVariables.kHeaderText,
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
                    Container(
                      child: Form(
                        key: _signInFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            IdentityContainer(
                                identityInfo: widget.authEmail,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AuthEmailScreen()),
                                  );
                                }),
                            SizedBox(
                              height: 30,
                            ),
                            CustomTextField(
                              controller: _passwordcontroller,
                              hintText: 'Password',
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomButton(
                        onTap: () {
                          if (_signInFormKey.currentState!.validate()) {
                            SignUserIn();
                          }
                        },
                        text: 'Login'),
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
