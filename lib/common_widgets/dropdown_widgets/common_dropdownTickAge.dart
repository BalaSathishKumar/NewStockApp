import 'package:base_flutter_provider_project/constants/local_images.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/models/LocationsModel/ProfessionModel.dart';
import '../../data/models/LocationsModel/ProfessionModel.dart';


class CustomDropdownTickAge extends StatefulWidget {
  final Agegroup? selectedValue;
  final String? dropdwnicon;
  final TextStyle textdecoration;
  final Color iconcolor;
  final Color underlinecolor;
  final double devicewidth;
  final List<Agegroup?> options;
  final ValueChanged<Agegroup?> onChanged;

  const CustomDropdownTickAge({
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
  State<CustomDropdownTickAge> createState() => _CustomDropdownTickAgeState();
}


class _CustomDropdownTickAgeState extends State<CustomDropdownTickAge> {
  bool isOpen = false;
  String selectOption = "Select Option";


  @override
  Widget build(BuildContext context) {
    return DropdownButton<Agegroup?>(
      itemHeight: null,
      isExpanded: true,
      value: widget.selectedValue,
      icon: SvgPicture.asset( widget.dropdwnicon ?? LocalSVGImages.dropdwn),
      iconDisabledColor:  widget.iconcolor,
      iconEnabledColor:  widget.iconcolor,
      iconSize: 35,
     // dropdownColor: Colors.grey[200],
      underline: Container(
        height: 1,
        color:  widget.underlinecolor, // Set the underline color
      ),

        selectedItemBuilder: (BuildContext context) {
          return widget.options.map((Agegroup? value) {
            return Container(
              height: 30,
             // color: Colors.red,
              child: Column(
                children: [
                  Text(
                      widget.selectedValue?.name ?? "",
                    style: CustomTextStyle.txt20Rbtxtpurple,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          }).toList();
        },
      items:  widget. options.map((Agegroup? value) {
        return DropdownMenuItem<Agegroup?>(
          value: value,
          child:ListTile(
            title: Text(value?.name ?? ""),
            trailing:  widget.selectedValue == value! ?   SvgPicture.asset(
                LocalSVGImages.sqrtck,
                height: 25,
                width: 16)
                : null,
          ),
        );
      }).toList(),

      onChanged:  widget.onChanged,
    );
  }
}
