import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:flutter/material.dart';

import '../../constants/local_images.dart';


class InSightListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imgtag;
  final String trailingImage;

  InSightListTile({
    required this.title,
    required this.subtitle,
    required this.imgtag,
    required this.trailingImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        leading:  Container(
          height: 80,
          width: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              trailingImage,
              width: 80,
              height: 80,
              fit: BoxFit.fill,
            ),
          ),
        ),
        title: Text(title,maxLines: 2,overflow: TextOverflow.ellipsis,),
        subtitle: Container(
          height: 50,
         // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Jan 16th, 2023",style: CustomTextStyle.txt14Rrtxtlisttilegrey,),
              Text("By SaudaGuru",style: CustomTextStyle.txt14Rrtxtlisttilegrey,),
            ],
          ),
        ),

      ),
    );
  }
}