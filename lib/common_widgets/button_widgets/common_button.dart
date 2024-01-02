import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomMaterialButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text,style: TextStyle(fontSize: 18,fontFamily: "Roboto"),),
      color: Appcolors.txtlitegreen2,
      textColor: Appcolors.black,
      minWidth: 200.0,
      height: 48.0,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Appcolors.black, width: 1.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}