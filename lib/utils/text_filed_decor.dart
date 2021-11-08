import 'package:flutter/material.dart';

class TextDecor extends StatelessWidget {
  final bool isObscure;
  final bool isWithLabel;
  final TextEditingController txtE;
  final bool isEnabled;
  final bool removePadding;
  final String hint;
  final Function s;
  final Icon icon;

  TextDecor(
      {Key key,
      this.isObscure = false,
      this.isWithLabel = false,
      this.txtE,
      this.isEnabled = true,
      this.removePadding = false,
      this.hint,
      this.s,
      this.icon})
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
          textAlign: TextAlign.left,
          controller: txtE,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              child: Container(
                height: 24,
                width: 24,
                child: icon,
              ),
            ),
            fillColor: Theme.of(context).dividerColor,
            hintText: "$hint",
            hintStyle: TextStyle(
              fontSize: 13.0,
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              // borderSide: BorderSide(
              //   width: 0.1,
              //   style: BorderStyle.solid,
              // ),
              borderSide: BorderSide(
                width: 1.5,
                color: Colors.grey[300],
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              // borderSide: BorderSide(
              //   width:0.1,
              //   style: BorderStyle.solid,
              // ),
              borderSide: BorderSide(
                width: 1.5,
                color: Colors.grey[300],
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              // borderSide: BorderSide(
              //   width:0.1,
              //   style: BorderStyle.solid,
              // ),
              borderSide: BorderSide(
                width: 1.5,
                color: Color(0xFFFFB206),
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
