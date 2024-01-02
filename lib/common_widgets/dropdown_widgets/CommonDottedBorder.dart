import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:io';
import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../utils/common_textstyles.dart';

class CommonDottedBorder extends StatelessWidget {
  String uploadtxt;
  String tagname;
  final String? storeddata;
  File? idproof;
  final VoidCallback onPressed;

  CommonDottedBorder(
      {
        required this.uploadtxt,
        required this.tagname,
        required this.onPressed,
        required this.idproof,
        this.storeddata
      }
      );

  @override
  Widget build(BuildContext context) {
    print('storeddata in common dotted ${storeddata}');
    return DottedBorder(
      dashPattern: [16, 4],
      strokeWidth: 1,
      color: Appcolors.kyctxtgrey,
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      radius: Radius.circular(16),
      child: Container(
        height: 100,
      //  color: Colors.red,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                   //color: Appcolors.kyctxtgrey,
                 /*   image: DecorationImage(
                      image: idproof != null ?setImage(): AssetImage( LocalPNGImages.samplepropic),
                        *//*NetworkImage(
                                        items[index].imageUrl,
                                      ),*//*
                      fit: BoxFit.fill,
                    ),*/
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                 child:  buildClipRRect(),
                ),
              ),

              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: onPressed,
                  child: Container(
                    height: 60,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Hero(
                            tag: tagname,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(LocalSVGImages.fileupload,
                                  height: 25, width: 16),
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 4,
                          child: Container(
                           // height: 60,
                            width: 200,
                        //    color: Colors.green.shade100,
                            child: Center(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Center(
                                        child: Text(
                                          uploadtxt,
                                          style: CustomTextStyle.txt14kyctxtgrey,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        //  color: Colors.red.shade100,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(uploadtxt == "Id proof Upload" || uploadtxt == "PAN Upload" ? "*" : "",
                                            style: TextStyle(color: Colors.red),),
                                        ],
                                      )),
                                    )
                                  ],
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ClipRRect buildClipRRect() {

    if(storeddata == null || storeddata!.isEmpty){
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: idproof == null
            ? SvgPicture.asset(LocalSVGImages.imgplh,
          fit: BoxFit.fill,
        ):Image.file(idproof!,fit:BoxFit.cover,),
      );
    }else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: storeddata == null
            ? SvgPicture.asset(LocalSVGImages.imgplh,
          fit: BoxFit.fill,
        ):Image.network(storeddata!,fit:BoxFit.cover,),
      );
    }


  }

  setImage() {
    if(  idproof != null) {
      Image.file(idproof!, fit: BoxFit.cover,);
    }
  }
}
