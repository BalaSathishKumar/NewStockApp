import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ui/Register/RegisterPage.dart';

class CommonTextField extends StatelessWidget {
  final FocusNode;
  CommonTextField({
    required this.FocusNode
});
  @override
  Widget build(BuildContext context) {
    final dataModel = context.watch<UserageProvider>();

    return TextFormField(
      focusNode: FocusNode,
      controller: TextEditingController(text: dataModel.UserageValue),
      onChanged: (value) {
        dataModel.setUserAgeValue(value);
      },
      decoration: InputDecoration(labelText: 'Enter Text'),
    );
  }
}
