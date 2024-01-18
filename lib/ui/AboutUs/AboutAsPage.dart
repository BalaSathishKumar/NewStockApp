import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:base_flutter_provider_project/data/models/Insights_model/HouseOfInvestingModel.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:base_flutter_provider_project/viewModel/blogs_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../common_widgets/appbar_widgets/logotxtappbar.dart';
import '../../constants/local_images.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {

late BlogsViewModel _blogsViewModel;

@override
  void initState() {
  super.initState();
_blogsViewModel = Provider.of<BlogsViewModel>(context,listen : false) ;

WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  _blogsViewModel.Hoiapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes);
});
}

  @override
  Widget build(BuildContext context) {

    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Consumer<BlogsViewModel>(
      builder: (context,hoiVM,child){
        var houseLength =hoiVM.HoiResponseModel?.house?.length ?? 0;

      return Scaffold(

          appBar: CustomAppBar(height: 60.0, title: 'House of Investing', appbarclr: Appcolors.white),
          backgroundColor: Appcolors.white,
          body: Container(
            height: deviceheight,
            width: devicewidth,
            //color: Colors.green,
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 160,
                          width: devicewidth,
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              color: Appcolors.splashbgcolor,
                            borderRadius: BorderRadius.circular(12)
                          ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  //color: Colors.red,
                                    width: devicewidth/2-40,
                                    child: Text(setFirstElement(hoiVM.HoiResponseModel?.house,""),style: CustomTextStyle.txt24Rbblack,maxLines: 2,)),
                                Text(setFirstElement(hoiVM.HoiResponseModel?.house,"des"),style: CustomTextStyle.txt12Rlblk,maxLines: 1,),//Sauda AI can predict which stocks are worth your money.
                                SizedBox(
                                  height: 16,
                                ),
                              Row(
                                children: [
                                  Text("Check it out"),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  SvgPicture.asset(LocalSVGImages.ar1,
                                    fit: BoxFit.fill,),
                                ],
                              )
                              ],
                            ),
          ),
                          Container(
                            height: 160,
                            width: devicewidth,
                           // color: Colors.red,
                            child:   Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                    height: 70,
                                    width: 100,
                                  //      color: Colors.red,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: SvgPicture.asset(LocalSVGImages.hoibg,height: 50,width: 80,fit: BoxFit.cover,),
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                          SizedBox(
                            height: 8,
                          ),
                      alignedLayout(context,hoiVM.HoiResponseModel?.house),

                      Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 60),
                            child: Container(

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
                          ),

                    ],
                  ),
                ),
              ),
            ),

          ));}
    );
  }



 Widget alignedLayout(BuildContext context, List<House>? house) {
    return      MasonryGridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 8.0,
                itemCount: house?.length ?? 0,
                itemBuilder: (context, index) {

                  if(index == 0) {
                    return SizedBox.shrink();
                  }

                  return  Container(

                      decoration: BoxDecoration(
                          color: Color(int.parse(house?[index].colorText ?? "0xFFD8F46C")),
                          borderRadius:  house?[index].title == null || house?[index].title == ""? BorderRadius.circular(20):BorderRadius.circular(12)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            house?[index].title == null || house?[index].title == ""?SizedBox.shrink(): Text(house?[index].title ?? "",style: CustomTextStyle.txt24Rbwhite  ,maxLines: 2,),
                            house?[index].description ==null ?SizedBox.shrink():  Text(house?[index].description ?? "",style: CustomTextStyle.txt12Rlblk,maxLines: 2,),

                            Row(
                              children: [
                                Expanded(
                                    flex:3,
                                    child: Text(house?[index].button ??"Check it out",maxLines: 4,style:  house?[index].title == null || house?[index].title == ""? CustomTextStyle.txt24Rbwhite :CustomTextStyle.txt12Rbtxtwhite)),

                                Expanded(
                                  flex:1,
                                  child: SvgPicture.asset(LocalSVGImages.ar1,
                                    fit: BoxFit.fill,),
                                ),
                              ],
                            )
                          ],
                        ),
                      ));
                });


 }

  onFailureRes(String p1) {
  }

  onSuccessRes(HouseOfInvestingModel? p1) {
  }

  String setFirstElement(List<House>? house, String description) {

  if(house != null && house.length > 0){
    if(description == "des"){
      return house[0].description ?? "";
    }else{
      return house[0].title ?? "";
    }

  }
  return "";
  }
}

