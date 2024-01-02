import 'package:base_flutter_provider_project/constants/local_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/common_textstyles.dart';


class CustomDropdown extends StatelessWidget {
  final String selectedValue;
  final String? dropdwnicon;
  final TextStyle textdecoration;
  final Color iconcolor;
  final Color underlinecolor;
  final double devicewidth;
  final List<String> options;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    Key? key,
    this.dropdwnicon,
    required this.selectedValue,
    required this.textdecoration,
    required this.iconcolor,
    required this.underlinecolor,
    required this.devicewidth,
    required this.options,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      itemHeight: null,
      isExpanded: true,
      value: selectedValue,
      icon: SvgPicture.asset(dropdwnicon ?? LocalSVGImages.dropdwn),
      iconDisabledColor: iconcolor,
      iconEnabledColor: iconcolor,
      iconSize: 35,
      //dropdownColor: Colors.grey[200],
      underline: Container(
        height: 1,
        color: underlinecolor, // Set the underline color
      ),

      selectedItemBuilder: (BuildContext context) {
        return options.map((String? value) {
          return Container(
            height: 30,
            // color: Colors.red,
            child: Column(
              children: [

                RichText(
                  text: TextSpan(
                      text:  selectedValue,
                        style: selectedValue == "Select gender" || selectedValue == "Select Roll"|| selectedValue == "Select Residence"?CustomTextStyle.txt16kyctxtgrey:textdecoration,
                      children: [
                        TextSpan(
                            text: selectedValue == "Select gender" || selectedValue == "Select Roll"|| selectedValue == "Select Residence"?' *':"",
                            style: TextStyle(color: Colors.red))
                      ]),
                ),

            /*    Text(
                  selectedValue,
                  style: selectedValue == "Select gender" || selectedValue == "Select Roll"?CustomTextStyle.txt16kyctxtgrey:textdecoration,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),*/
              ],
            ),
          );
        }).toList();
      },


      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Text(value, style: textdecoration,overflow: TextOverflow.ellipsis,maxLines: 2,)
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
