import 'package:flutter/material.dart';

class TextDecorTransparentTwo extends StatelessWidget {
  final bool isObscure;
  final bool isWithLabel;
  final TextEditingController txtE;
  final bool isEnabled;
  final bool removePadding;
  final String hint;
  final Function s;

  TextDecorTransparentTwo(
      {Key key,
      this.isObscure = false,
      this.isWithLabel = false,
      this.txtE,
      this.isEnabled = true,
      this.removePadding = false,
      this.hint,
      this.s})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 10.0, horizontal: removePadding ? 0.0 : 24.0),
        child: TextFormField(
          obscureText: isObscure,
          onChanged: s,
          enabled: isEnabled,
          textAlign: TextAlign.center,
          controller: txtE,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: "$hint",
            hintStyle: TextStyle(
              fontSize: 13.0,
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color: Color(0xFFFFB206),
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color: Color(0xFFFFB206),
              ),
            ),
            filled: true,
            contentPadding: EdgeInsets.only(left: 0),
          ),
        ),
      ),
    );
  }
}
