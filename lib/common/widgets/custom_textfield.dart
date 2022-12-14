import 'package:flutter/material.dart';
import 'package:jumia_auth/constants/global_variables.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  const CustomTextField(
      {required this.controller,
      required this.hintText,
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: GlobalVariables.secondaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: GlobalVariables.greyBackgroundCOlor),
        ),
        label: Text(
          '$hintText',
          style: TextStyle(color: GlobalVariables.secondaryColor),
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return '$hintText';
        }
        return null;
      },
    );
  }
}

class IdentityContainer extends StatelessWidget {
  final VoidCallback onTap;
  final String identityInfo;
  const IdentityContainer({required this.identityInfo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      color: Color(0xffeeeeee),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(identityInfo),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: TextButton(onPressed: onTap, child: Text('Edit')),
            )
          ],
        ),
      ),
    );
  }
}

// class DatePickerTextFormField extends StatefulWidget {
//   const DatePickerTextFormField({required}) ;

//   @override
//   State<DatePickerTextFormField> createState() =>
//       _DatePickerTextFormFieldState();
// }

// class _DatePickerTextFormFieldState extends State<DatePickerTextFormField> {
//   late DateTime date;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       //keyboardType: TextInputType.datetime,
//       decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderSide: BorderSide(color: GlobalVariables.secondaryColor),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: GlobalVariables.greyBackgroundCOlor),
//           ),
//           label: Text(
//             '$date',
//             style: TextStyle(color: GlobalVariables.secondaryColor),
//           ),
//           hintStyle: TextStyle(
//             color: Colors.grey,
//           ),
//           prefixIcon: IconButton(
//             icon: Icon(Icons.calendar_today),
//             onPressed: () async {
//               DateTime? newDate = await showDatePicker(
//                 context: context,
//                 initialDate: date,
//                 firstDate: DateTime(1900),
//                 lastDate: DateTime(2000),
//               );
//               if (newDate == null) return null;
//               setState(() {
//                 date = newDate;
//               });
//             },
//           ),
//           hintText: '${date.year}/${date.month}/${date.day}'),
//       validator: (val) {
//         if (val == null || val.isEmpty) {
//           return '$date';
//         }
//         return null;
//       },
//     );
//   }
// }
