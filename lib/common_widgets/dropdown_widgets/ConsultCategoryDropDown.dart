
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/local_images.dart';
import '../../data/models/dashboard_model/DashboardResponseModel.dart';
import '../../utils/common_textstyles.dart';


class ConsultCategoryDropDown extends StatelessWidget {
  final Category? selectedValue;
  final TextStyle textdecoration;
  final Color iconcolor;
  final String? dropdwnicon;
  final Color underlinecolor;
  final double devicewidth;
  final List<Category?> options;
  final ValueChanged<Category?> onChanged;

  const ConsultCategoryDropDown({
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
      child: DropdownButton<Category?>(
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
          return options.map((Category? value) {
            return Container(
              height: 30,
              // color: Colors.red,
              child: Column(
                children: [
                  Text(
                    selectedValue?.categoryName ?? "",
                    style: CustomTextStyle.txt14Rbtxtblk,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          }).toList();
        },

        items: options.map((Category? value) {
          return DropdownMenuItem<Category?>(
            value: value,
            child: ListTile(
              title: Text(value?.categoryName ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyle.txt14Rmtxtblk),
              trailing:  selectedValue == value ?   SvgPicture.asset(
                  LocalSVGImages.sqrtck,
                  height: 25,
                  width: 16)
                  : null,
            ),


            /*  Container(
                width: devicewidth,
                child: Text()),*/
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}