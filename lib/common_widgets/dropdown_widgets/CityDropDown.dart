import 'package:base_flutter_provider_project/data/models/LocationsModel/CityModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/local_images.dart';
import '../../utils/common_textstyles.dart';


class CityDropdown extends StatelessWidget {
  final Cities? selectedValue;
  final TextStyle textdecoration;
  final Color iconcolor;
  final Color underlinecolor;
  final String? dropdwnicon;
  final double devicewidth;
  final List<Cities?> options;
  final ValueChanged<Cities?> onChanged;

  const CityDropdown({
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
    return Container(
      child: DropdownButton<Cities?>(
        isDense: true,
        isExpanded: true,
        icon: SvgPicture.asset(dropdwnicon ?? LocalSVGImages.dropdwn),
        value: selectedValue,
        iconDisabledColor: iconcolor,
        iconEnabledColor: iconcolor,
        iconSize: 35,
        //dropdownColor: Colors.grey[200],
        underline: Container(

          height: 1,
          color: underlinecolor, // Set the underline color
        ),

        selectedItemBuilder: (BuildContext context) {

          return options.map((Cities? value) {
            return Container(
              height: 30,
              // color: Colors.red,
              child: Column(
                children: [
                  /*Text(
                    selectedValue?.name ?? "",
                    style: selectedValue?.name == "Enter City" ?CustomTextStyle.txt16kyctxtgrey:textdecoration,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),*/

                  RichText(
                    text: TextSpan(
                        text:  selectedValue?.name ?? "",
                        style: selectedValue?.name == "Enter City" ? CustomTextStyle.txt16kyctxtgrey:textdecoration,
                        children: [
                          TextSpan(
                              text: selectedValue?.name == "Enter City" ?' *':"",
                              style: TextStyle(color: Colors.red))
                        ]),
                  ),

                ],
              ),
            );
          }).toList();
        },



        items: options.map((Cities? value) {
          return DropdownMenuItem<Cities?>(
            value: value,
            child: Container(

                width: devicewidth, child: Text(value?.name ?? "", style: textdecoration)),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}