import 'package:base_flutter_provider_project/common_widgets/dropdown_widgets/common_dropdownTick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../data/models/dashboard_model/DashBoardFilterModel.dart';
import '../../data/models/dashboard_model/DashboardResponseModel.dart';
import '../../ui/home/homepage.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/dashboard_view_model.dart';
import '../../viewModel/profession_view_model.dart';
import '../button_widgets/LGgRoundedBtn.dart';
import '../dropdown_widgets/common_dropdown.dart';
import '../dropdown_widgets/common_dropdownTickAge.dart';
import '../dropdown_widgets/common_dropdownTickProf.dart';
import 'StockSections.dart';

class TrendingStocks extends StatelessWidget {
  const TrendingStocks({
    super.key,
    required this.firsttitle,
    required this.secondtitle,
    required this.imagetag,
    required this.onPressed,
    required this.devicewidth,
    required this.trendingstocks,
    required this.Filterdata,
    required this.OnTrengStocksPressed,
  });

  final String firsttitle;
  final String secondtitle;
  final String imagetag;
  final double devicewidth;
  final VoidCallback onPressed;
  final List<FeaturedStocks>? trendingstocks;
  final  List<FDataa>? Filterdata ;
  final Function(FDataa?) OnTrengStocksPressed;
  final String _selectedOption = 'Stock Category';

  @override
  Widget build(BuildContext context) {

    final crossAxisCount = 4;
    final containerWidth = 160.0;
    final containerHeight = 230;

    final aspectRatio = containerWidth / containerHeight;
  //  final crossAxisCount = 4;
  /*  final aspectRatio = (MediaQuery.of(context).size.width /
        crossAxisCount /
        (MediaQuery.of(context).size.height / crossAxisCount));*/
    return    Consumer<DashboardViewModel>(
        builder: (context, dashTS, child) {
         // print('trending filtersss ${dashTS.dashboardFilterResponseModel2?.data?.length ?? []}');
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    "",
                    style: CustomTextStyle.txt12Rmtxtblk,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      firsttitle,
                      style: CustomTextStyle.txt14Rb500,
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Consumer<ProfessionViewModel>(
                        builder: (context, profession, child) {
                          return Container(
                            height: 56,
                            width: devicewidth,
                            //  color: Colors.red.shade100,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: CustomDropdownTickProf(
                                    dropdwnicon: LocalSVGImages.dropdwnpur,
                                    underlinecolor: Appcolors.txtpurple,
                                    iconcolor: Appcolors.txtpurple,
                                    textdecoration: CustomTextStyle
                                        .txt24Rmtxtblk,
                                    devicewidth: 90,
                                    selectedValue: profession.UserProfessionTS,
                                    options: profession.FilterProfessionList,
                                    onChanged: (value) {
                                      if (value != null) {
                                        print('Selected profession ${value
                                            .name} : ${value.id}');
                                        profession.setUserProfessionTS(value);

                                        Map<String, dynamic> filterparams2 =
                                        {
                                          "category_id": 0,
                                          "type": "trending_stocks",
                                          "age": profession.UserAgeGroup?.value,
                                          "sectors": profession.UserProfessionTS?.id.toString(),
                                          "city": profession.FilterCity,
                                        };

                                        Provider.of<DashboardViewModel>(
                                            context, listen: false)
                                            .dashboardfilterapi2(
                                            onFailureRes: onFilterFailureRes,
                                            onSuccessRes: onFilter2SuccessRes,
                                            filterparams: filterparams2);


                                      } else {
                                        print('value is null');
                                      }
                                    },
                                  ),
                                ),
                                buildSizedBox(height: 0, width: 5),
                                Expanded(flex: 1,
                                    child: Text("living in",
                                        style: CustomTextStyle.txt12Rmtxtblk)),
                                buildSizedBox(height: 0, width: 5),
                                Expanded(
                                  flex: 4,
                                  child: Consumer<ProfessionViewModel>(

                                    builder: (context, filtercity, child) {
                                      return CustomDropdownTick(
                                        dropdwnicon: LocalSVGImages.dropdwnpur,
                                        underlinecolor: Appcolors.txtpurple,
                                        iconcolor: Appcolors.txtpurple,
                                        textdecoration: CustomTextStyle
                                            .txt24Rmtxtblk,
                                        devicewidth: 90,
                                        selectedValue: filtercity.FilterCity ??
                                            "",
                                        options: filtercity.filterCity,
                                        onChanged: (value) {
                                          if (value != null) {
                                            filtercity.setFilterCity(value);
                                          } else {
                                            print('value is null');
                                          }

                                          //  setState(() {
                                          //  _selectedOption = value!;
                                          // });
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                    )),
                Container(
                  height: 50,
                  width: devicewidth,
                  //    color: Colors.green.shade100,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                                height: 50,
                                //     color: Colors.yellow,
                                child: Center(
                                    child: Text(
                                      "under age",
                                      style: CustomTextStyle.txt12Rmtxtblk,
                                    )))),
                        Expanded(
                          flex: 3,
                          child: Consumer<ProfessionViewModel>(
                            builder: (context, profession, child) {
                              return CustomDropdownTickAge(
                                dropdwnicon: LocalSVGImages.dropdwnpur,
                                underlinecolor: Appcolors.txtpurple,
                                iconcolor: Appcolors.txtpurple,
                                textdecoration: CustomTextStyle.txt24Rmtxtblk,
                                devicewidth: 90,
                                selectedValue: profession.UserAgeGroup,
                                options: profession.AgeGroupList,
                                onChanged: (value) {
                                  if (value != null) {
                                    profession.setUserAgeGroup(value);
                                    Map<String, dynamic> filterparams2 =
                                    {
                                      "category_id": 0,
                                      "type": "trending_stocks",
                                      "age": value.value,
                                      "sectors": profession.UserProfessionTS?.id
                                          .toString(),
                                      "city": profession.FilterCity,
                                    };

                                    Provider.of<DashboardViewModel>(
                                        context, listen: false)
                                        .dashboardfilterapi2(
                                        onFailureRes: onFilterFailureRes,
                                        onSuccessRes: onFilter2SuccessRes,
                                        filterparams: filterparams2);
                                  } else {
                                    print('value is null');
                                  }
                                },
                              );
                            },
                          ),
                        ),
                        Expanded(
                            flex: 6,
                            child: Container(
                              // color: Colors.orange,
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text("are investing in these stocks.",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyle.txt12Rmtxtblk
                                      ),
                                    ],
                                  ),
                                ))),
                      ],
                    ),
                  ),
                ),
                Container(
                  //   height: 300,
                  width: devicewidth,
                //     color: Colors.green.shade100,
                  child: getFilterData(Filterdata?.length ?? 0)
                      ? Container(
                    height: 100,
                      child: Center(child: Text("No data found")))
                      : GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 12,
                        crossAxisCount: crossAxisCount,
                        // Number of columns in the grid
                        childAspectRatio: aspectRatio),
                    itemCount: setFilterData(Filterdata?.length ?? 0),
                    itemBuilder: (context, index) {

                      return  GestureDetector(
                        onTap: () {
                          OnTrengStocksPressed(Filterdata?[index]);
                        },
                        child: GridTile(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                //  height: 160,
                                //   width: 100,
                                //     color: Colors.yellow,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      //  buildSizedBox(height: 20, width: 10),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          //  height: 60,
                                          //  width: 100,
                                          //width: devicewidth,
                                          //           color: Colors.orange,
                                          child: Center(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(14),
                                              child: Image.network(
                                                Filterdata?[index].stock?.photoUrl ?? "",
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      buildSizedBox(height: 5, width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          //           color: Colors.green,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              Filterdata?[index].stock?.name ?? "",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: CustomTextStyle.txt10Rb,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      //   buildSizedBox(height: 5, width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          //     color: Colors.white,
                                          child: Center(
                                            child: Text(Filterdata?[index].stock?.maturity ?? "",
                                                style: CustomTextStyle.txt14Rb400),
                                          ),
                                        ),
                                      ),
                                      //    buildSizedBox(height: 5, width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          //            color: Colors.lightGreenAccent,
                                          child: Text(
                                             // "\u20B9${Filterdata?[index].stock?.priceMeta ?? ""}",
                                              Filterdata?[index].stock?.priceMeta ?? "",
                                              style:
                                              CustomTextStyle
                                                  .txt14Rrtxtblktxtpurple),
                                        ),
                                      ),
                                    ],
                                  )),
                            )),
                      );
                    },
                  ),
                ),
                Container(
                    height: 110,
                    width: devicewidth,
                    //  color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                        onTap:onPressed,
                          child: Container(
                            height: 50,
                            width: devicewidth / 2,
                            child: LgRoundedBtn(
                              width: 150,
                              height: 100,
                              text: 'Discover more',
                              iconData: Icons.arrow_forward,
                              backgroundColor: Appcolors.txtlitegreen2,
                              textColor: Appcolors.black,
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

  onFilter2SuccessRes(DashBoardFilterModel? p1) {
  }

  getFilterData(int filterdata) {
  //  print('filter data length ${filterdata}');
    if(filterdata == null || filterdata == 0){
      return true;
    }else{
      return false;
    }
  }

  setFilterData(int filterdataLength) {
    if(filterdataLength >=8){
      return 8;
    }else{
      return filterdataLength;
    }
  }
}

class TrendingDropOptions with ChangeNotifier {
  String _trendingdropoptiions = "Doctors";

  String get trengingdropoptions => _trendingdropoptiions;

  void getTrendingDropOPtions(String pcd) {
    _trendingdropoptiions = pcd;
    notifyListeners();
  }
}

class TrendingDropOptions2 with ChangeNotifier {
  String _trendingdropoptiions2 = "Madurai";

  String get trengingdropoptions2 => _trendingdropoptiions2;

  void getTrendingDropOPtions2(String pcd) {
    _trendingdropoptiions2 = pcd;
    notifyListeners();
  }
}

class TrendingDropOptions3 with ChangeNotifier {
  String _trendingdropoptiions3 = "25 to 30";

  String get trengingdropoptions3 => _trendingdropoptiions3;

  void getTrendingDropOPtions3(String pcd) {
    _trendingdropoptiions3 = pcd;
    notifyListeners();
  }
}
