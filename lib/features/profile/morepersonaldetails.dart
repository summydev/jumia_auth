import 'package:flutter/material.dart';
import 'package:jumia_auth/common/widgets/custom_textfield.dart';
import 'package:jumia_auth/common/widgets/custon_button.dart';
import 'package:jumia_auth/constants/global_variables.dart';
import 'package:jumia_auth/features/services/auth_services.dart';

class morePersonalDetails extends StatefulWidget {
  static const routeName = '/emailsignup-personaldetails-more';
  final String authEmail;
  final String firstName;
  final String middleName;
  final String lastName;
  final String phoneNumber;
  const morePersonalDetails(
      {required this.authEmail,
      required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.phoneNumber});

  @override
  State<morePersonalDetails> createState() => _morePersonalDetailsState();
}

class _morePersonalDetailsState extends State<morePersonalDetails> {
  final TextEditingController _gendercontroller = TextEditingController();
  final TextEditingController _birthdaycontroller = TextEditingController();
  final _morepersonaldetailsFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  late DateTime date = DateTime(24, 05, 2022);
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
    _gendercontroller.dispose();
  }

  void addPersonalDetails() {
    authService.addPersonalDetails(
      context: context,
      email: widget.authEmail,
      gender: _gendercontroller.text,
      birthDay: _birthdaycontroller.text,
      phoneNumber: widget.phoneNumber,
      firstName: widget.firstName,
      middleName: widget.middleName,
      lastName: widget.lastName,
    );
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
                  'Personal Details',
                  style: GlobalVariables.kHeaderText,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Almost done...Just a few more details',
                  style: TextStyle(
                    fontSize: 16,
                    color: GlobalVariables.greyBackgroundCOlor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Form(
                      key: _morepersonaldetailsFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextField(
                              controller: _gendercontroller,
                              hintText: 'Gender',
                              keyboardType: TextInputType.name),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: GlobalVariables.secondaryColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          GlobalVariables.greyBackgroundCOlor),
                                ),
                                label: Text(
                                  'birth date',
                                  style: TextStyle(
                                      color: GlobalVariables.secondaryColor),
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                hintText:
                                    '${date.day}/${date.month}/${date.year}'),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return '${date.year}/${date.month}/${date.day}';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CustomButton(
                              onTap: () {
                                if (_morepersonaldetailsFormKey.currentState!
                                    .validate()) {
                                  addPersonalDetails();
                                }
                              },
                              text: 'Continue'),
                        ],
                      )),
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
                SizedBox(
                  width: 100,
                  child: Image.asset(
                    'images/Jumia-Logo.png',
                    width: 100,
                  ),
                )
              ],
            ),
          ),
        ),
      ))),
    );
  }
}
