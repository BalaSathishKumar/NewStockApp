import 'package:base_flutter_provider_project/data/models/Insights_model/CatBasedBlogsModel.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../constants/colors.dart';
import '../../utils/common_functions.dart';

class BlogDetail extends StatefulWidget {

  final Blogs? calist;

   BlogDetail({
     required this.calist
  });

  @override
  State<BlogDetail> createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {


  @override
  void initState() {
    super.initState();
    print(' widget.calist?.imageUrl ${ widget.calist?.imageUrl}');
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(height: 60.0, title: widget.calist?.title ?? "", appbarclr: Appcolors.white),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0,right: 18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Image.network(
                  widget.calist?.imageUrl ?? "",
                  width: devicewidth,
                  height: 160,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: devicewidth,
              //  color: Colors.red.shade100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.calist?.categoryName ?? "",maxLines: 1,overflow: TextOverflow.ellipsis,style: CustomTextStyle.txt12Rb400gry),
                    SizedBox(height: 10),
                    Container(
                      child: Text(widget.calist?.title ?? "",style: CustomTextStyle.txt16Rb,),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      // color: Colors.red,
                      child: Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex:1,
                              child: Text(formatDate2(widget.calist?.createdAt ?? "")+', '+ formatYear(widget.calist?.createdAt ?? "").toString(),style: CustomTextStyle.txt14Rrtxtlisttilegrey,)),
                          Expanded(
                              flex:2,
                              child: Text("By ${widget.calist?.authorName ?? ""}",style: CustomTextStyle.txt14Rrtxtlisttilegrey,)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: HtmlWidget(
                  ''' ${widget.calist?.description}''',
                  onErrorBuilder: (context, element, error) => Text('$element error: $error'),
                  onLoadingBuilder: (context, element, loadingProgress) => CircularProgressIndicator(),

                  // this callback will be triggered when user taps a link
                  /*  onTapUrl: (url) => print('tapped $url'),*/

                  renderMode: RenderMode.column,
                  textStyle: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
