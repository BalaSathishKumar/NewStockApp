import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class RoundedContainer extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final VoidCallback onPressed;

  const RoundedContainer({
    Key? key,
    required this.text,
    required this.iconData,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 45,
        width: 210,

        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: text == "Explore Sauda Pros"?Appcolors.white:Appcolors.black, width: 1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                height: 45,
                //color: Colors.red,
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16.0,
                      fontFamily: "Roboto"
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Container(
                height: 45,
              //  color: Colors.green,
                child: Icon(
                  iconData,
                  color: textColor,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
