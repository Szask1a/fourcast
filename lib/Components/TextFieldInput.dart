import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key key,
    this.inputAction,
    this.inputType,
    this.obsecureText,
    this.onSubmit,
    @required this.onSearch,
    @required this.hint,
    @required this.icon,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool obsecureText;
  final Function onSearch;
  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.09,
      width: size.width * 0.95,
      decoration: BoxDecoration(
        color: Colors.grey[500].withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(
                icon,
                size: 28,
                color: Colors.white,
              ),
            ),
            hintText: hint,
            hintStyle: GoogleFonts.josefinSans(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          obscureText: obsecureText,
          style: GoogleFonts.josefinSans(
            fontSize: 25,
            color: Colors.white,
          ),
          keyboardType: inputType,
          textInputAction: inputAction,
          onChanged: onSearch,
          onSubmitted: onSubmit,
          autocorrect: true,
        ),
      ),
    );
  }
}