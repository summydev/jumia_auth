import 'package:flutter/material.dart';
import 'package:jumia_auth/constants/global_variables.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomButton({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 300,
      height: 50,
      child: RaisedButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
              letterSpacing: 1.5,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        color: GlobalVariables.secondaryColor,
      ),
    );
  }
}

class CustomButtonB extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomButtonB({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 300,
      height: 50,
      child: RaisedButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.facebook,
              color: Colors.white,
              size: 30,
            ),
            Text(
              text,
              style: TextStyle(
                  letterSpacing: 1.5,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
        color: Color(0xff1877f2),
      ),
    );
    ;
  }
}
