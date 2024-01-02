import 'package:flutter/material.dart';

import '../button_widgets/common_button.dart';

class CustomBottomSheet extends StatelessWidget {
  String headtxt;
  String headtxt2;
 String butntxt1;
 String butntxt2;
  final VoidCallback onCancelButtonPressed;
  final VoidCallback onContinueButtonPressed;

  CustomBottomSheet({
    required this.headtxt,
    required this.headtxt2,
    required this.butntxt1,
    required this.butntxt2,
    required this.onCancelButtonPressed,
    required this.onContinueButtonPressed
});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 45,right: 45),
            child: Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(
                        headtxt,
                      textAlign:TextAlign.left,
                      style: TextStyle(fontSize: 24, fontFamily: "Roboto",),
                    ),
                  ),
                  Text(headtxt2,
                      style: TextStyle(fontSize: 14, fontFamily: "Roboto-Light",)),
                ],
              )
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 38.0,left: 18,right: 18),
                child: Container(
                  height: 50,
                  width: 130,
                  child: CustomMaterialButton(
                    text: butntxt1,
                    onPressed: onCancelButtonPressed
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 38.0,left: 18,right: 18),
                child: Container(
                  height: 50,
                  width: 130,
                  child: CustomMaterialButton(
                      text: butntxt2,
                      onPressed: onContinueButtonPressed
                  ),
                ),
              ),


            ],
          ),
        ],
      ),
    decoration: BoxDecoration(

        borderRadius: BorderRadius.only(
    topLeft: Radius.circular(16.0),
    topRight: Radius.circular(16.0),
    ))
    );
  }
}