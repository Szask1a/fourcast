import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.buttonName,
    @required this.onPressed,
  }) : super(key: key);

  final String buttonName;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.09,
      width: size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.blueAccent,
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: GoogleFonts.josefinSans(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}