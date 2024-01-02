import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../utils/CustomBorderClipper.dart';
import '../../utils/common_textstyles.dart';
import 'CommonRangeSlider.dart';


class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({
    super.key,
    required this.devicewidth,
    required this.currentRangeValues,
    required this.onpressed,
    required this.firsttxt,
    required this.secondtxt,
    required this.onChanged,
    required this.minController,
    required this.maxController,
  }) ;

  final double devicewidth;
  final String firsttxt;
  final String secondtxt;
  final RangeValues currentRangeValues;
  final Function(RangeValues) onpressed;
  final  Function(String) onChanged;
  final TextEditingController minController;
  final TextEditingController maxController;

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {

  late final TextEditingController _minPriceController;
  late final TextEditingController _maxPriceController;


@override
  void initState() {
  super.initState();
  _minPriceController = widget.minController;
  _maxPriceController = widget.maxController;

  //_minPriceController.text= widget.currentRangeValues.start.toString();
  //_maxPriceController.text= widget.currentRangeValues.start.toString();
}


/*@override
  void didUpdateWidget(covariant CustomRangeSlider oldWidget) {
  super.didUpdateWidget(oldWidget);
     print('_minPriceController.text ${_minPriceController.text}');
    _minPriceController.text= widget.currentRangeValues.start.toString();
    _maxPriceController.text= widget.currentRangeValues.end.toString();
}*/


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
     // color: Colors.red.shade50,
      child: ClipRect(
        clipper: TopBorderClipper(20.0),
    child: DottedBorder(
    dashPattern: [8, 4],
    strokeWidth: 1,
    color: Appcolors.kyctxtgrey,
    strokeCap: StrokeCap.square,
    borderType: BorderType.RRect,
    radius: Radius.circular(0),
    child:Padding(
        padding:
        const EdgeInsets.only(left: 18.0, right: 18, top: 18),
        child: Column(
          children: [
            Row(
              children: [
                RichText(
                  textAlign: TextAlign.left,
                  text:  TextSpan(
                    style: CustomTextStyle.txt24Rbblack,
                    children: <TextSpan>[
                      TextSpan(text: widget.firsttxt),
                      TextSpan(text: widget.secondtxt, style: CustomTextStyle.txt24Rlblk),
                    ],
                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Expanded(
                    flex:2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        buildRangeField(_minPriceController),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Min",style: CustomTextStyle.txt12gpquickstatsgrey,),
                            widget.firsttxt == "RETURNS" ?Text("%",style: CustomTextStyle.txt12gpquickstatsgrey,):Text(""),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0,right: 3.0,),
                    child: Container(
                      height: 30,
                      width: 32,
                      //color: Colors.green,
                      child: Column(
                        children: [
                          Divider(
                            color: Appcolors.kyctxtgrey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex:2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        buildRangeField(_maxPriceController),



                  /*      Container(
                         // width: 110,
                          height: 30,
                          decoration: BoxDecoration(
                            border:
                            Border.all(width: 1, color:  Appcolors.kyctxtgrey),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              widget.currentRangeValues.end.toString(),
                              style: CustomTextStyle.txt14Rrtxtgry2,
                            ),
                          ),
                        ),*/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Max",style: CustomTextStyle.txt12gpquickstatsgrey,),
                            widget.firsttxt == "RETURNS"?Text("%",style: CustomTextStyle.txt12gpquickstatsgrey,):Text(""),
                          ],
                        )
                      ],
                    ),
                  ),
            /*      SizedBox(
                    height: 50,
                    width: devicewidth/3,
                  )*/
                ],
              ),
            ),
            CommonRangeSlider(
                currentRangeValues: widget.currentRangeValues,
                onPressed: widget.onpressed
            ),
          ],
        ),
      ),
    )));
  }

  Container buildRangeField(TextEditingController ctlr) {
    return Container(
                      //  width: 110,
                        height: 30,
                        decoration: BoxDecoration(
                    //      color: Colors.red,
                          border: Border.all(width: 1, color:  Appcolors.kyctxtgrey),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: ctlr,
                            onChanged: widget.onChanged,
                          )
                        /*  Text(
                            currentRangeValues.start.toString(),
                            style: CustomTextStyle.txt14Rrtxtgry2,
                          ),*/
                        ),
                      );
  }
}