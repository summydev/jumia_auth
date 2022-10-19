import 'package:flutter/material.dart';
import 'package:jumia_auth/common/widgets/custon_button.dart';
import 'package:jumia_auth/constants/global_variables.dart';

class AccountCreatedScreen extends StatefulWidget {
  final String firstName;
  const AccountCreatedScreen({required this.firstName});

  @override
  State<AccountCreatedScreen> createState() => _AccountCreatedScreenState();
}


class _AccountCreatedScreenState extends State<AccountCreatedScreen> {
    @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(widget.firstName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                  ' ${widget.firstName}, Your account has been created!',
                  style: GlobalVariables.kHeaderText,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'You\'ll be redirected in 1 seconds',
                  style: TextStyle(
                    fontSize: 16,
                    color: GlobalVariables.greyBackgroundCOlor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(onTap: () {}, text: 'Get Started'),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 100,
                  child: Image.asset(
                    'images/Jumia-Logo.png',
                    width: 100,
                  ),
                )
              ],
            )),
          ),
        ),
      )),
    );
  }
}
