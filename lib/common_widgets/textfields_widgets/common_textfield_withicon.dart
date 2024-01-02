import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/colors.dart';
import '../../utils/common_functions.dart';

class CustomTextFieldicon extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final TextAlign txtalign;
  final TextInputType textInputType;
  final IconData labelicon;
  final String localsvg;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final bool? enabled;
  final Key? key;
  final String? labeliconUnselected;
 // final GlobalKey<FormState> formKey;

  const CustomTextFieldicon({
    // required this.formKey,
    this.key,
    required this.hintText,
    required this.controller,
    required this.labelicon,
    required this.onChanged,
    required this.txtalign,
    required this.textInputType,
    required this.localsvg,
    this.validator,
    this.onSaved,
    this.enabled,
    this.labeliconUnselected

  }) : super(key: key);

  @override
  State<CustomTextFieldicon> createState() => _CustomTextFieldiconState();
}

class _CustomTextFieldiconState extends State<CustomTextFieldicon> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: widget.controller,
      onChanged: widget.onChanged,
      style: CustomTextStyle.txt16Rb,
      validator: widget.validator,
   /*     validator: (value) {
        if (value == null || value.isEmpty) {

          return 'Please enter all fields';
        }
        return null; // Return null if input is valid
      },*/
      enabled: widget.enabled,
      keyboardType: widget.textInputType,
      textAlign: widget.txtalign,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
        label: RichText(
          text: TextSpan(
              text:  widget.hintText,
              style: CustomTextStyle.txt16kyctxtgrey,
              children: [
                TextSpan(
                    text: widget.hintText == 'Referral code'? '':' *',
                    style: TextStyle(color: Colors.red))
              ]),
        ),
        labelStyle: TextStyle(color: Color(0xFF6F6F6F)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              width: 1, color: Appcolors.kyctxtgrey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Appcolors.splashbgcolor),
        ),
      //  hintText:
        /*buildRichText(
          TextSpan(text: "FOLIO"),
          TextSpan(text: "VALUE", style: CustomTextStyle.txt24Rbblack), CustomTextStyle.txt24Rlblk,
        ),*/
     //   widget.hintText,
        focusColor: Appcolors.splashbgcolor,
      //  hintStyle: CustomTextStyle.txt16kyctxtgrey,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 20.0,top: 10,bottom: 10),
          child: widget.localsvg ==""? Icon(widget.labelicon,color: _focusNode.hasFocus ? Appcolors.splashbgcolor : Colors.blue,):
          SvgPicture.asset(
              _focusNode.hasFocus ? widget.localsvg : widget.labeliconUnselected ?? ""),
        ),
      ),

    );
  }
}


