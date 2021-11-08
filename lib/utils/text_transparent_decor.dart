import 'package:flutter/material.dart';

class TextDecorTransparent extends StatelessWidget {
  final bool isObscure;
  final bool isWithLabel;
  final TextEditingController txtE;
  final bool isEnabled;
  final bool removePadding;
  final String hint;
  final Function s;

  TextDecorTransparent(
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
            vertical: 0.0, horizontal: removePadding ? 0.0 : 24.0),
        child: TextFormField(
          obscureText: isObscure,
          onChanged: s,
          enabled: isEnabled,
          textAlign: TextAlign.left,
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
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              // borderSide: BorderSide(
              //   width:0.1,
              //   style: BorderStyle.solid,
              // ),
              borderSide: BorderSide(
                width: 0,
                color: Colors.white,
                style: BorderStyle.solid,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                color: Colors.white,
                style: BorderStyle.solid,
              ),
            ),
            filled: isWithLabel,
            contentPadding: EdgeInsets.only(left: 20, top: 13, bottom: 13),
          ),
        ),
      ),
    );
  }
}
