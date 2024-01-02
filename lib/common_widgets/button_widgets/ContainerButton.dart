import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../ui/explore/exploreFilter.dart';
import '../../utils/common_textstyles.dart';

class ContainerButton extends StatelessWidget {
  const ContainerButton({
    super.key,
    required this.devicewidth,
    required this.buttonname,
    required this.stars,
    required this.ratingType,
  });

  final double devicewidth;
  final String buttonname;
  final String stars;
  final String ratingType;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 40,
      width: devicewidth,

      child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           stars == "HRF"
               ? Consumer<FilterPriceSelect>(
                   builder: (context, FilterPrice, child) {
                     return Container(
                       height: 40,
                       width: devicewidth,
                       decoration: BoxDecoration(
                           color:  setColor(FilterPrice,stars),   //FilterPrice.FilterPriceSelectF ? Appcolors.splashbgcolor2 : Appcolors.white,
                           border: Border.all(color: Appcolors.black, width: 1),
                           borderRadius: BorderRadius.circular(6)),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(buttonname,
                               style: CustomTextStyle.txt14Rmtxtblk,
                               maxLines: 1,
                               softWrap: false,
                               overflow: TextOverflow.ellipsis),
                         ],
                       ),
                     );
                   })
               : Text(""),
           stars == "LRF"
               ? Consumer<FilterPriceSelect>(
                   builder: (context, FilterPrice, child) {
                     return Container(
                       height: 40,
                       width: devicewidth,
                       decoration: BoxDecoration(
                           color: setColor(FilterPrice,stars),  //FilterPrice.FilterPriceSelectF2 ? Appcolors.splashbgcolor2 : Appcolors.white,
                           border:
                           Border.all(color: Appcolors.black, width: 1),
                           borderRadius: BorderRadius.circular(6)),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(buttonname,
                               style: CustomTextStyle.txt14Rmtxtblk,
                               maxLines: 1,
                               softWrap: false,
                               overflow: TextOverflow.ellipsis),
                         ],
                       ),
                     );
                   })
               : Text(""),
           stars == "3"
               ? Consumer<FilterPriceSelect>(
                   builder: (context, FilterPrice, child) {
                     return Container(
                       height: 40,
                       width: devicewidth,
                       decoration: BoxDecoration(
                           color: setColor(FilterPrice,stars),         //FilterPrice.FilterPriceSelectF3 ? Appcolors.splashbgcolor2 : Appcolors.white,
                           border: Border.all(color: Appcolors.black, width: 1),
                           borderRadius: BorderRadius.circular(6)),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(Icons.star, color: Colors.yellow, size: 12),
                           Icon(Icons.star, color: Colors.yellow, size: 12),
                           Icon(Icons.star, color: Colors.yellow, size: 12),
                           Text(buttonname,
                               style: CustomTextStyle.txt14Rmtxtblk,
                               maxLines: 1,
                               softWrap: false,
                               overflow: TextOverflow.ellipsis),
                         ],
                       ),
                     );
                   }
               )
               : Text(""),
           stars == "2"
               ? Consumer<FilterPriceSelect>(
                   builder: (context, FilterPrice, child) {
                     return Container(
                       height: 40,
                       width: devicewidth,
                       decoration: BoxDecoration(
                           color: setColor(FilterPrice,stars), //FilterPrice.FilterPriceSelectF4 ? Appcolors.splashbgcolor2 : Appcolors.white,
                           border:
                           Border.all(color: Appcolors.black, width: 1),
                           borderRadius: BorderRadius.circular(6)),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(Icons.star, color: Colors.yellow, size: 15),
                           Icon(Icons.star, color: Colors.yellow, size: 15),
                           Text(buttonname,
                               style: CustomTextStyle.txt14Rmtxtblk,
                               maxLines: 1,
                               softWrap: false,
                               overflow: TextOverflow.ellipsis),
                         ],
                       ),
                     );
                   })
               : Text(""),
           stars == "1"
               ? Consumer<FilterPriceSelect>(
                   builder: (context, FilterPrice, child) {
                     return Container(
                       height: 40,
                       width: devicewidth,
                       decoration: BoxDecoration(
                           color: setColor(FilterPrice,stars),  //FilterPrice.FilterPriceSelectF5 ? Appcolors.splashbgcolor2 : Appcolors.white,
                           border:
                           Border.all(color: Appcolors.black, width: 1),
                           borderRadius: BorderRadius.circular(6)),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(Icons.star, color: Colors.yellow, size: 15),
                           Text(buttonname,
                               style: CustomTextStyle.txt14Rmtxtblk,
                               maxLines: 1,
                               softWrap: false,
                               overflow: TextOverflow.ellipsis),
                         ],
                       ),
                     );
                   })
               : Text(""),
         ],
       ),
    );
  }

  setColor(FilterPriceSelect filterPrice, String stars) {
    //"userrating" : "saudarating",
  if(stars == "HRF"){
    if(ratingType == "userrating"){
      return filterPrice.FilterPriceSelectF ? Appcolors.splashbgcolor2 : Appcolors.white;
    }else{
      return filterPrice.FilterSaudaRating1 ? Appcolors.splashbgcolor2 : Appcolors.white;
    }
    }else if(stars == "LRF"){
    if(ratingType == "userrating"){
      return filterPrice.FilterPriceSelectF2 ? Appcolors.splashbgcolor2 : Appcolors.white;
    }else{
      return filterPrice.FilterSaudaRating2 ? Appcolors.splashbgcolor2 : Appcolors.white;
    }
  }else if(stars == "3"){
    if(ratingType == "userrating"){
      return filterPrice.FilterPriceSelectF3 ? Appcolors.splashbgcolor2 : Appcolors.white;
    }else{
      return filterPrice.FilterSaudaRating3 ? Appcolors.splashbgcolor2 : Appcolors.white;
    }
  }else if(stars == "2"){
    if(ratingType == "userrating"){
      return filterPrice.FilterPriceSelectF4 ? Appcolors.splashbgcolor2 : Appcolors.white;
    }else{
      return filterPrice.FilterSaudaRating4 ? Appcolors.splashbgcolor2 : Appcolors.white;
    }
  }else {
    if(ratingType == "userrating"){
      return filterPrice.FilterPriceSelectF5 ? Appcolors.splashbgcolor2 : Appcolors.white;
    }else{
      return filterPrice.FilterSaudaRating5 ? Appcolors.splashbgcolor2 : Appcolors.white;
    }
  }
  }
}