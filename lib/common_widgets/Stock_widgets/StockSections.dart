import 'package:base_flutter_provider_project/data/models/dashboard_model/DashboardResponseModel.dart';
import 'package:base_flutter_provider_project/viewModel/CommonProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../data/models/Explore_model/ExploreModel.dart';
import '../../data/models/dashboard_model/DashBoardFilterModel.dart';
import '../../ui/home/homepage.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/dashboard_view_model.dart';
import '../dropdown_widgets/CategoryDropDown.dart';
import '../dropdown_widgets/common_dropdown.dart';

class StocksSections extends StatelessWidget {
  const StocksSections({
    super.key,
    required this.firsttitle,
    required this.secondtitle,
    required this.optionslist,
    required this.imagetag,

    required this.devicewidth,
    required this.viewall,
    required this.ipostocks,
    required this.featuredStocks,
    required this.OnTopStocksPressed,
    required this.OnTopStocksPressed2,
    required this.OnIpoStocksPressed,
    required this.Filterdata,
    required this.ViewallClick,

  });

  final String firsttitle;
  final String secondtitle;
  final String imagetag;
  final List<Category> optionslist;

  final double devicewidth;
  final String viewall;
  final List<IpoFpo>? ipostocks;
  final List<FeaturedStocks>? featuredStocks;
  final  List<FDataa>? Filterdata ;
  final Function(FeaturedStocks?) OnTopStocksPressed2;
  final Function(FDataa?) OnTopStocksPressed;
  final Function(IpoFpo?) OnIpoStocksPressed;
  final Function(String?) ViewallClick;


  @override
  Widget build(BuildContext context) {

    return Consumer<CommonProvider>(
      builder: (context,commonvm,child) {
        return Container(
          //color: Colors.yellow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 50,
                        //  color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Container(
                                  child: Text(
                                    firsttitle,
                                    style: CustomTextStyle.txt12Rmtxtblk,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                //  color: Colors.green,
                                child: secondtitle == "IPO & FPO" ?
                                buildRichText2(
                                  textspanlist(),
                                  CustomTextStyle.txt24Rbblack,
                                ) : Text(
                                  secondtitle,
                                  style: CustomTextStyle.txt24Rbblack,
                                ),

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    optionslist.isNotEmpty
                        ? Consumer<DropOptions>(
                      builder: (context, dropoptions, child) {
                        return Expanded(
                          flex: 3,
                          child: Container(
                            //   color: Colors.blue,
                            height: 50,
                            width: 130,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 18.0),
                                  child: CategoryDropdown(
                                    dropdwnicon: LocalSVGImages.dropdwnpur,
                                    underlinecolor: Appcolors.txtpurple,
                                    iconcolor: Appcolors.txtpurple,
                                    textdecoration: CustomTextStyle
                                        .txt16Rmtxtpurp,
                                    devicewidth: 130,
                                    selectedValue: dropoptions._dropoptiions,
                                    //_selectedOption,
                                    options: optionslist,
                                    onChanged: (value) {
                                      if (value != null) {
                                        Provider.of<DropOptions>(
                                            context, listen: false)
                                            .getDropOPtions(value);

                                        Map<String, dynamic> filterparams =
                                        {
                                          "category_id": value.id,
                                          "type": "featured_stocks",
                                          "age": "",
                                          "sectors": "",
                                          "city": "",
                                        };

                                        Provider.of<DashboardViewModel>(
                                            context, listen: false)
                                            .dashboardfilterapi(
                                            onFailureRes: onFilterFailureRes,
                                            onSuccessRes: onFilterSuccessRes,
                                            filterparams: filterparams);
                                      } else {
                                        print('value is null');
                                      }

                                      //  setState(() {
                                      //  _selectedOption = value!;
                                      // });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                        : Container(),
                  ],
                ),
              ),
              Container(
                height: 160,
                //   color: Appcolors.txtpurple,
                child: secondtitle == "IPO & FPO" ?
                ListView.builder(
                    itemCount: ipostocks?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      //   print('ipo image ${ipostocks?[index].stock?.photoUrl}');
                      return GestureDetector(
                        onTap: () {
                          OnIpoStocksPressed(ipostocks?[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 80,
                              width: 80,
                              // color: Colors.redAccent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                             Container(
                                    //    color: Colors.yellow,
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage:
                                        //AssetImage( items[index].imageUrl,),
                                        ipostocks?[index].stock?.photoUrl !=
                                            null ?
                                        NetworkImage(
                                          ipostocks?[index].stock?.photoUrl ??
                                              "",
                                          // items[index].imageUrl,
                                        ) : PlaceholderImageProvider(),
                                      )),
                                  //   buildSizedBox(height: 20, width: 10),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      //height: 50,
                                      // color: Colors.green,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(
                                              ipostocks?[index].stock?.name ?? "",
                                              // items[index].text,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: CustomTextStyle.txt10Rb,
                                              textAlign: TextAlign.center,
                                            ),


                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  //   buildSizedBox(height: 5, width: 10),
                                 Expanded(
                                    flex: 1,
                                    child: Container(
                                      //     color: Colors.orange,
                                      height: 10,
                                      width: 100,
                                      child: Center(
                                        child: Text(
                                            ipostocks?[index].stock?.maturity ?? "",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                           // style: CustomTextStyle.txt14Rrtxtblk
                                            style:  CustomTextStyle.txt14Rb400
                                        ),
                                      ),
                                    ),
                                  ),

                                  //Expanded( flex:1,child: Container()),
                                  //    buildSizedBox(height: 5, width: 10),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      //     color: Colors.blue,
                                      child: Text( ipostocks?[index].stock?.priceMeta ?? "",
                                         // maxLines: 1,
                                        //  overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyle.txt14Rrtxtblktxtpurple),
                                    ),
                                  )
                                     ,
                                  //Expanded( flex:1,child: Container()),
                                ],
                              )),
                        ),
                      );
                    }) :
                Filterdata != null && Filterdata!.isEmpty ?
                Center(
                    child: Text("No Data Found!")) :
                ListView.builder(
                  //  itemCount: featuredStocks?.length,
                    itemCount: Filterdata?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        // focusColor: Colors.red,
                        onTap: () {
                          //   OnTopStocksPressed(featuredStocks?[index]);

                          commonvm.setSelectedIndex(index);
                          OnTopStocksPressed(Filterdata?[index]);
                          print('stock sec index ${commonvm.SelectedIndex}');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 80,
                              width: 80,
                         /*     decoration: BoxDecoration(
                                border: Border.all(
                                  color: commonvm.SelectedIndex == index ?Appcolors.splashbgcolor2 : Appcolors.white,  // Color of the border
                                  width: 2.0,         // Width of the border
                                ),
                              ),*/
                            /*  color: commonvm.SelectedIndex == index ? Colors.redAccent
                                  .shade100 : Colors.white,*/
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  secondtitle != "IPO & FPO" ? Container(
                                    //    color: Colors.yellow,
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage:
                                        //AssetImage( items[index].imageUrl,)
                                        NetworkImage(Filterdata?[index].stock?.photoUrl ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8MUlZWpRSwcRsyUrIByKJ3tPpxud1BLcq5CGwR7aB&s"
                                          //  items[index].imageUrl,
                                        ),
                                      )) : Container(
                                    //    color: Colors.yellow,
                                      child: const CircleAvatar(
                                        radius: 30,
                                        backgroundImage: AssetImage(
                                         LocalPNGImages.placeholder),
                                        /*  NetworkImage(
                                          items[index].imageUrl,
                                        ),*/
                                      )),
                                  //   buildSizedBox(height: 20, width: 10),
                                  secondtitle != "IPO & FPO" ? Container(
                                    //   color: Colors.green,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 5.0, top: 8),
                                      child: Center(
                                        child: Text(
                                          Filterdata?[index].stock?.name ?? "",
                                          // items[index].text,
                                          style: CustomTextStyle.txt10Rb,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ) : Container(
                                    height: 50,
                                    // color: Colors.green,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Text(
                                              Filterdata?[index].stock?.name ??
                                                  "",
                                              //  items[index].text,
                                              style: CustomTextStyle
                                                  .txt10Rrtxtblk,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                  ),
                                  //   buildSizedBox(height: 5, width: 10),
                                  secondtitle != "IPO & FPO" ? Container(
                                    // color: Colors.orange,

                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 5.0),
                                      child: Center(
                                        child: Text(
                                            Filterdata?[index].stock?.maturity ?? "",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: CustomTextStyle.txt14Rb400),
                                      ),
                                    ),
                                  ) : Container(),
                                  //Expanded( flex:1,child: Container()),
                                  //    buildSizedBox(height: 5, width: 10),
                                  secondtitle != "IPO & FPO" ? Container(
                                    width: 100,
                                    //       color: Colors.blue,
                                    child:

                                    Center(
                                      child: Text(
                                         // "\u20B9 ${Filterdata?[index].stock?.buyingPrice ?? ""}",
                                          Filterdata?[index].stock?.priceMeta ?? "",
                                          style: CustomTextStyle
                                              .txt14Rrtxtblktxtpurple),
                                    ),
                                  ) : Container(),
                                  //Expanded( flex:1,child: Container()),
                                ],
                              )),
                        ),
                      );
                    }),
              ),
              viewall == "viewallul" ?
              Container(
                  height: 60,
                  //  color: Colors.redAccent,
                  width: devicewidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 50,
                          width: devicewidth / 2,
                          // color: Appcolors.splashbgcolor,
                          child: Divider(
                            color: Appcolors.splashbgcolor,
                            height: 2,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Text(" View all Unlisted Stocks",
                                style: CustomTextStyle.txt14Rmtxtpurp,),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Hero(
                                  tag: imagetag,
                                  child: SvgPicture.asset(
                                      LocalSVGImages.viewall,
                                      height: 25, width: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )) :
              Container(
                //  height: 60,
                //   color: Colors.redAccent,
                  width: devicewidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 10,
                          width: devicewidth / 2,
                          // color: Appcolors.splashbgcolor,
                          child: Divider(
                            thickness: 1,
                            color: Appcolors.splashbgcolor,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (secondtitle == "IPO & FPO") {
                            return ViewallClick("IPO & FPO");
                          } else {
                            return ViewallClick("Top Stocks");
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Text(" View all ",
                                style: CustomTextStyle.txt14Rmtxtpurp,),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Hero(
                                  tag: imagetag,
                                  child: SvgPicture.asset(
                                      LocalSVGImages.viewall,
                                      height: 14, width: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        );
      }
    );
  }



  onFilterFailureRes(String p1) {
  }

  onFilterSuccessRes(DashBoardFilterModel? p1) {
  }

  List<TextSpan> textspanlist() {

    List<TextSpan> spans = [
      TextSpan(text: "IPO"),
      TextSpan(text: " & ", style: CustomTextStyle.txt24Rlblk),
      TextSpan(text: "FPO"),

    ];
    return spans;
  }
}

class DropOptions with ChangeNotifier {
  Category? _dropoptiions ;
  Stocks? _dropStock ;
  int? _stockid;

  Category? get dropoptions => _dropoptiions;
  Stocks? get dropStock => _dropStock;
  int? get stockid => _stockid;

  void getDropOPtions(Category? pcd) {
    _dropoptiions = pcd;
    notifyListeners();
  }
  void getDropStocks(Stocks? pcd) {
    _dropStock = pcd;
    notifyListeners();
  }
  void getDropOPtionsStockid(int? pcd) {
    _stockid = pcd;
    notifyListeners();
  }
}
