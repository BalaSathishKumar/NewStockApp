import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/common_textstyles.dart';

class AgreementCheckbox extends StatelessWidget {
  final String label;
  final value;
  final ValueChanged<bool?>? onChanged;
  final bool IsSendEq;

  AgreementCheckbox({
    required this.label,
    required this.onChanged,
    required this.value,
    required this.IsSendEq
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,

      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          IsSendEq?   Expanded(
            flex: 1,
            child: Container(
                child: Text(label,style: CustomTextStyle.txt14Rltitlegrey3)),
          ):Text(""),
          Expanded(
            flex: 1,
            child: Checkbox(
              activeColor: Appcolors.splashbgcolor,
              value: value, // Initial checkbox state
              onChanged: onChanged,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
                child: Text(IsSendEq?"":label,style: CustomTextStyle.txt12Rltxtgry)),
          ),
        ],
      ),
    );
  }
}