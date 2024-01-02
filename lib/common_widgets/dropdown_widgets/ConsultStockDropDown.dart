
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/local_images.dart';
import '../../data/models/Explore_model/ExploreModel.dart';
import '../../utils/common_textstyles.dart';



class ConsultStockDropDown extends StatelessWidget {
  final Stocks? selectedValue;
  final TextStyle textdecoration;
  final Color iconcolor;
  final String? dropdwnicon;
  final Color underlinecolor;
  final double devicewidth;
  final List<Stocks?> options;
  final ValueChanged<Stocks?> onChanged;

  const ConsultStockDropDown({
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
    //List<String> countries = ["Canada", "Russia", "USA", "China", "United Kingdom", "USA", "India"];
  //  var seen = Set<Stocks>();
   // List<Stocks?> uniquelist = options.where((country) => seen.add(country!)).toList();
    return Container(
      child: DropdownButton<Stocks?>(
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
          return options.map((Stocks? value) {
            return Container(
              height: 30,
              // color: Colors.red,
              child: Column(
                children: [
                  Text(
                    selectedValue?.name ?? "",
                    style: CustomTextStyle.txt20Rbtxtpurple,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          }).toList();
        },

 /*   items: expdata.exploreModel?.data?.stocks?.asMap().entries.map((entry) {
    int index = entry.key;
    // DropdownItem item = entry.value;
    Stocks item = entry.value;*/


        items: options.asMap().entries.map((entry) {
          int index = entry.key;
         Stocks? item = entry.value;
          return DropdownMenuItem<Stocks?>(
            value: item,
            child: ListTile(
              title: Text(item?.name ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyle.txt14Rmtxtblk),
              trailing:  selectedValue == item ?   SvgPicture.asset(
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