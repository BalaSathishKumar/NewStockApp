import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../utils/common_textstyles.dart';


class ChatClearBtSheet extends StatelessWidget {
  ChatClearBtSheet({
    super.key,
    required this.onClearPressed,
    required this.OnBlockPressed,
    required this.OnCancelPressed
  });
  VoidCallback onClearPressed;
  VoidCallback OnBlockPressed;
  VoidCallback OnCancelPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
          color: Appcolors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          )),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Container(
            height: 5,
            width: 200,
            decoration: BoxDecoration(
              color: Appcolors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 5,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Appcolors.dividergrey,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: GestureDetector(
              onTap: onClearPressed,
              child: Text(
                "Clear Chat",
                textAlign:TextAlign.left,
                style:CustomTextStyle.txt16Rrblk,
              ),
            ),
          ),
          Padding (
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 5,
              width: 200,
              decoration: BoxDecoration(
                color: Appcolors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 2,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Appcolors.dividergrey,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: GestureDetector(
              onTap: OnBlockPressed,
              child: Text(
                "Block User",
                textAlign:TextAlign.left,
                style:CustomTextStyle.txt16Rrred,
              ),
            ),
          ),
          SizedBox(height: 20,),
          MaterialButton(
            onPressed: OnCancelPressed,
            child: Text("Cancel",style: TextStyle(fontSize: 20,fontFamily: "Roboto"),),
            color: Appcolors.cancelgrey,
            textColor: Appcolors.black,
            minWidth: 260.0,
            height: 48.0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Appcolors.cancelgrey, width: 1.0),
              borderRadius: BorderRadius.circular(12.0),
            ),
          )
        ],
      ),

    );
  }
}