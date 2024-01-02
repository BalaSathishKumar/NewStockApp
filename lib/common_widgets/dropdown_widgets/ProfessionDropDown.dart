import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/local_images.dart';
import '../../data/models/LocationsModel/ProfessionModel.dart';
import '../../utils/common_textstyles.dart';


class ProfessionDropdown extends StatelessWidget {
  final Professions? selectedValue;
  final TextStyle textdecoration;
  final Color iconcolor;
  final String? dropdwnicon;
  final Color underlinecolor;
  final double devicewidth;
  final List<Professions?> options;
  final ValueChanged<Professions?> onChanged;

  const ProfessionDropdown({
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
    print('inside prof drop down ${selectedValue?.name}');
    return Container(
      child: DropdownButton<Professions?>(
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

          return options.map((Professions? value) {
            return Container(
              height: 30,
              // color: Colors.red,
              child: Column(
                children: [
           /*       Text(
                    selectedValue?.name ?? "",
                    style: selectedValue?.name == "Enter Profession" ?CustomTextStyle.txt16kyctxtgrey:textdecoration,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),*/

                  RichText(
                    text: TextSpan(
                        text:  selectedValue?.name ?? "",
                        style: selectedValue?.name == "Enter Profession" ? CustomTextStyle.txt16kyctxtgrey:textdecoration,
                        children: [
                          TextSpan(
                              text: selectedValue?.name == "Enter Profession" ?' *':"",
                              style: TextStyle(color: Colors.red))
                        ]),
                  ),


                ],
              ),
            );
          }).toList();
        },



        items: options.map((Professions? value) {

          return DropdownMenuItem<Professions?>(
            value: value,
            child: Container(

                width: devicewidth, child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(value?.name ?? "", style: textdecoration),
            )),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
