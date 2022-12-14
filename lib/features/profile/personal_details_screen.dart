import 'package:flutter/material.dart';
import 'package:jumia_auth/common/widgets/custom_textfield.dart';
import 'package:jumia_auth/common/widgets/custon_button.dart';
import 'package:jumia_auth/constants/global_variables.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:jumia_auth/features/profile/morepersonaldetails.dart';
import 'package:jumia_auth/features/services/auth_services.dart';

class PersonalDetails extends StatefulWidget {
  static const routeName = '/emailsignup-personaldetails';
  final String authEmail;
  const PersonalDetails({required this.authEmail});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final TextEditingController _firstNamecontroller = TextEditingController();
  final TextEditingController _middleNamecontroller = TextEditingController();
  final TextEditingController _lastNamecontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  final _personaldetailsFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final countryPicker = const FlCountryCodePicker();
  //CountryCode? code;
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

    _firstNamecontroller.dispose();
    _middleNamecontroller.dispose();
    _lastNamecontroller.dispose();
    _phonecontroller.dispose();
  }

  // void addPersonalDetails() {
  //   authService.addPersonalDetails(
  //       context: context,
  //       email: widget.authEmail,
  //       firstName: _firstNamecontroller.text,
  //       middleName: _middleNamecontroller.text,
  //       lastName: _lastNamecontroller.text,
  //       phoneNumber: _phonecontroller.text);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  'We just need you to fill in some details',
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
                  key: _personaldetailsFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(
                          controller: _firstNamecontroller,
                          hintText: 'First Name',
                          keyboardType: TextInputType.name),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextField(
                          controller: _middleNamecontroller,
                          hintText: 'Middle Name',
                          keyboardType: TextInputType.name),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextField(
                          controller: _lastNamecontroller,
                          hintText: 'Last Name',
                          keyboardType: TextInputType.name),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextField(
                          controller: _phonecontroller,
                          hintText: "phone number",
                          keyboardType: TextInputType.phone),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                          onTap: () {
                            if (_personaldetailsFormKey.currentState!
                                .validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => morePersonalDetails(
                                            authEmail: widget.authEmail,
                                            firstName:
                                                _firstNamecontroller.text,
                                            middleName:
                                                _middleNamecontroller.text,
                                            lastName: _lastNamecontroller.text,
                                            phoneNumber: _phonecontroller.text,
                                          )));
                            }
                          },
                          text: 'Continue'),
                    ],
                  ),
                )),
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
            )),
          ),
        ),
      )),
    );
  }
}
