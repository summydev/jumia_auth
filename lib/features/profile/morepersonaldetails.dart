import 'package:flutter/material.dart';
import 'package:jumia_auth/common/widgets/custom_textfield.dart';
import 'package:jumia_auth/common/widgets/custon_button.dart';
import 'package:jumia_auth/constants/global_variables.dart';

class morePersonalDetails extends StatefulWidget {
  const morePersonalDetails({Key? key}) : super(key: key);

  @override
  State<morePersonalDetails> createState() => _morePersonalDetailsState();
}

class _morePersonalDetailsState extends State<morePersonalDetails> {
  final TextEditingController _gendercontroller = TextEditingController();
  final _morepersonaldetailsFormKey = GlobalKey<FormState>();
  late DateTime date = DateTime(2022, 05, 03);
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _gendercontroller.dispose();
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
                            //keyboardType: TextInputType.datetime,
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
                                // prefixIcon: IconButton(
                                //   icon: Icon(Icons.calendar_today),
                                //   onPressed: () async {
                                //     DateTime? newDate = await showDatePicker(
                                //       context: context,
                                //       initialDate: date,
                                //       firstDate: DateTime(1900),
                                //       lastDate: DateTime(2000),
                                //     );
                                //     if (newDate == null) return null;
                                //     setState(() {
                                //       date = newDate;
                                //     });
                                //   },
                                // ),
                                hintText:
                                    '${date.year}/${date.month}/${date.day}'),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return '${date.year}/${date.month}/${date.day}';
                              }
                              return null;
                            },
                            onTap: () async {
                              DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2000),
                              );
                              if (newDate == null) return null;
                              setState(() {
                                date = newDate;
                              });
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CustomButton(
                              onTap: () {
                                if (_morepersonaldetailsFormKey.currentState!
                                    .validate()) {
                                  // signUpUser();
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
