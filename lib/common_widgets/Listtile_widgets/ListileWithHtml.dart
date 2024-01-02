import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../constants/local_images.dart';


class ListTileWithHtml extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final String imgtag;
  final String trailingImage;

  ListTileWithHtml({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.imgtag,
    required this.trailingImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,

      child: Column(
        children: [
          ListTile(
           // leading: Icon(Icons.circle),
            title: HtmlWidget(
              ''' ${title}''',
              onErrorBuilder: (context, element, error) => Text('$element error: $error'),
              onLoadingBuilder: (context, element, loadingProgress) => CircularProgressIndicator(),

              // this callback will be triggered when user taps a link
            /*  onTapUrl: (url) => print('tapped $url'),*/

              renderMode: RenderMode.column,
              textStyle: TextStyle(fontSize: 14),
            ),
            //Text("${title}",maxLines: 2,overflow: TextOverflow.ellipsis,),
            subtitle: Container(
              height: 50,
            //  color: Colors.red.shade50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 3,
                      child: Text(date,style: CustomTextStyle.txt14Rrtxtgreen,)),
                  Expanded(
                      flex: 5,
                      child: Container(
                        // color: Colors.red.shade50,
                          child: Row(mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Text("${subtitle}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyle.txt14Rrtxtgreen,),
                              ),
                            ],
                          ))),
                ],
              ),
            ),
            trailing: SizedBox(
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
          ),
        ],
      ),
    );
  }
}