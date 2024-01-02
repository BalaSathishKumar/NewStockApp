import 'package:flutter/material.dart';

import '../../constants/colors.dart';


class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: controller,
      onChanged: onChanged,
      keyboardType: TextInputType. number,
      decoration: InputDecoration(
        hintText: hintText,

        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Appcolors.splashbgcolor, width: 1.0),
        )
      ),
    );
  }
}