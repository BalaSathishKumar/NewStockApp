import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomOutlinedTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  CustomOutlinedTextField({
    this.controller,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
height: 50,
     // width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(5),
 /*     decoration: BoxDecoration(
       // color: Colors.red,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),*/
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: labelText,
          contentPadding: EdgeInsets.only(top: 5,right: 5,bottom: 5,left: 14),
          hintStyle: TextStyle(fontFamily: "Roboto-LightItalic",fontSize: 16),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(width: 1, color: Appcolors.kyctxtgrey), //<-- SEE HERE
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                width: 1, color: Appcolors.splashbgcolor2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                width: 1, color: Appcolors.red),
          ),
          focusedErrorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                width: 1, color: Appcolors.splashbgcolor2),
          ),
        ),

      ),
    );
  }
}
