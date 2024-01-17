import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../common_widgets/appbar_widgets/logotxtappbar.dart';
import '../../constants/local_images.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
        /*appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            backgroundColor: Appcolors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgPicture.asset(LocalSVGImages.ic_brand_logo_green,
                  height: 25, width: 16),
            ),
            title: Text(
              "House of Investing",
              style: CustomTextStyle.txt18Rbblk,
            ),

          ),
        ),*/
        appBar: CustomAppBar(height: 60.0, title: 'House of Investing', appbarclr: Appcolors.white),
        backgroundColor: Appcolors.white,
        body: Container(
          height: deviceheight,
          width: devicewidth,
          //color: Colors.green,
          child: /*MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 8.0,
              // itemCount: items.length,
              itemCount: 5,
              itemBuilder: (context, index) {
                return HOItile();
              }),*/


            GridView.custom(semanticChildCount: 3,

              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 3,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: const [
                  QuiltedGridTile(2, 1),
                  QuiltedGridTile(2, 2),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                childCount: 7,
                    (context, index) {
                  return HOItile();
                    },
              ),
            )

        ));
  }

  Tile({required int index}) {

    switch(index) {
      case 1:
        return Container(
          height: 60,
          width: 80,
          decoration: BoxDecoration(
              color: Appcolors.splashbgcolor,
              borderRadius: BorderRadius.circular(16)
          ),
        );

      case 2:
        return Container(
          decoration: BoxDecoration(
              color: Appcolors.HOIpurple,
              borderRadius: BorderRadius.circular(16)
          ),

        );
      case 3:
        return Container(
          decoration: BoxDecoration(
              color: Appcolors.HOIbrown,
              borderRadius: BorderRadius.circular(16)
          ),

        );
      case 4:
        return Container(
          decoration: BoxDecoration(
              color:Appcolors.HOIred,
              borderRadius: BorderRadius.circular(16)
          ),

        );
      case 5:
        return Container(
          decoration: BoxDecoration(
              color: Appcolors.HOIorange,
              borderRadius: BorderRadius.circular(16)
          ),

        );
      case 6:
        return Container(

          decoration: BoxDecoration(
              color: Appcolors.HOIliteorange,
              borderRadius: BorderRadius.circular(16)
          ),
        );
      case 7:
        return Container(

          decoration: BoxDecoration(
              color: Appcolors.black,
              borderRadius: BorderRadius.circular(16)
          ),
        );
    }


  }
}

/*
Padding(
padding: const EdgeInsets.only(left: 8.0,top: 60),
child: Container(
height: 100,
//  color: Colors.yellow,
width: devicewidth,
child: Column(
children: [
RichText(
textAlign: TextAlign.left,
text: TextSpan(
style: CustomTextStyle.txt24Rlblk,
children: <TextSpan>[
TextSpan(text: "WE OPEN"),
TextSpan(
text: "POSSIBILITIES & OPPORTUNITIES",
style: CustomTextStyle.txt24Rbblack),
TextSpan(text: "TO THE WORLD OF"),
TextSpan(
text: "INVESTING",
style: CustomTextStyle.txt24Rbblack),
],
),
),
],
),
),
),*/



class HOItile extends StatelessWidget {
  const HOItile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 80,
      color: Colors.red,
    );
  }
}
