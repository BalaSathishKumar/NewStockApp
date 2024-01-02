
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String firstOptionText;
  final String secondOptionText;
  final bool? hidebutton;
  final VoidCallback? firstOptionCallback;
  final VoidCallback? secondOptionCallback;

  const CustomAlertDialog({
    required this.title,
    required this.content,
    required this.firstOptionText,
    required this.secondOptionText,
    this.firstOptionCallback,
    this.secondOptionCallback,
    this.hidebutton
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text(content),
          ],
        ),
      ),
      actions: [
        Visibility(
          visible: hidebutton ?? true,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Appcolors.splashbgcolor2, // Background color
              foregroundColor: Colors.white, // Text color
            ),
            onPressed: () {
              Navigator.pop(context);
              if (firstOptionCallback != null) {
                firstOptionCallback!();
              }
            },
            child: Text(firstOptionText),
          ),
        ),
        Visibility(
          visible: hidebutton ?? true,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Appcolors.splashbgcolor2, // Background color
              foregroundColor: Colors.white, // Text color
            ),
            onPressed: () {
              Navigator.pop(context);
              if (secondOptionCallback != null) {
                secondOptionCallback!();
              }
            },
            child: Text(secondOptionText),
          ),
        ),
      ],
    );
  }
}