import 'package:base_flutter_provider_project/data/models/Explore_model/ExploreModel.dart';
import 'package:base_flutter_provider_project/data/models/LocationsModel/ProfessionModel.dart';
import 'package:base_flutter_provider_project/viewModel/CommonProvider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/Explore_widgets/ExploreFTopBuy.dart';
import '../../common_widgets/RangeSlider/CustomRangeSlider.dart';
import '../../common_widgets/Stock_widgets/StockSections.dart';
import '../../common_widgets/Stock_widgets/TrendingStocks.dart';
import '../../common_widgets/appbar_widgets/common_appbar.dart';

import '../../common_widgets/button_widgets/ContainerButton.dart';
import '../../common_widgets/button_widgets/ParallelButtons.dart';
import '../../common_widgets/dropdown_widgets/ConsultCategoryDropDown.dart';
import '../../common_widgets/dropdown_widgets/common_dropdown.dart';
import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../utils/CustomBorderClipper.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/dashboard_view_model.dart';
import '../../viewModel/explore_view_model.dart';
import '../../viewModel/profession_view_model.dart';

class ExploreFilter extends StatefulWidget {
  const ExploreFilter({Key? key}) : super(key: key);

  @override
  State<ExploreFilter> createState() => _ExploreFilterState();
}

class _ExploreFilterState extends State<ExploreFilter> {
  RangeValues _currentRangeValues = const RangeValues(40, 80);

   String filterCat = "";
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();
  late ExploreViewModel _exploreViewModel;
  late ProfessionViewModel _professionViewModel;
  late CommonProvider _commonProvider;
  late DropOptions _dropOptions;
  @override
  void initState() {
    super.initState();
    _exploreViewModel = Provider.of<ExploreViewModel>(context, listen: false);
    _commonProvider = Provider.of<CommonProvider>(context, listen: false);
    _professionViewModel = Provider.of<ProfessionViewModel>(context, listen: false);
    _dropOptions = Provider.of<DropOptions>(context, listen: false);
    filterCat =_dropOptions.dropoptions?.id.toString() ?? "";

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _commonProvider.setChangeTab(_dropOptions.dropoptions?.id??-1);
      _commonProvider.setIsFilterApi(false);
    });

  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
   
    return Consumer<ProfessionViewModel>(
        builder: (context, cityVM, child) {
     return Scaffold(
          backgroundColor: Appcolors.white,
          appBar: CustomAppBar(height: 60.0, title: 'Filters', appbarclr: Appcolors.white),
          body: Container(
            height: deviceheight,
            width: devicewidth,
            color: Colors.white,
            child: Consumer<DashboardViewModel>(
                builder: (context, dashfildata, child) {
             return SingleChildScrollView(
                child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0,top: 10,right: 18),
                        child: Consumer<DropOptions>(builder: (context, consultCat, child) {
                          return ConsultCategoryDropDown(
                            dropdwnicon: LocalSVGImages.dropdwn,
                            underlinecolor: Appcolors.kyctxtgrey,
                            iconcolor: Appcolors.kyctxtgrey,
                            textdecoration: CustomTextStyle.txt16Rmtxtpurp,
                            devicewidth: 130,
                            selectedValue: consultCat.dropoptions,
                            //_selectedOption,
                            options: dashfildata.catList,
                            onChanged: (value) {
                              if (value != null) {
                                print('dropdown value ${value}');
                                filterCat = value.id.toString();
                                _dropOptions.getDropOPtions(value);
                                _commonProvider.setChangeTab(value.id ??-1);
                              } else {
                                print('value is null');
                              }

                              //  setState(() {
                              //  _selectedOption = value!;
                              // });
                            },
                          );
                        }),
                      ),
                      Consumer<exploreFiltervalues>(
                    builder: (context, Filtervalues, child) {
                    //  _minPriceController.text = Filtervalues.Filtervalues.start.toString();
                   //   _maxPriceController.text = Filtervalues.Filtervalues.end.toString();
                      return CustomRangeSlider(
                        minController: _minPriceController,
                        maxController: _maxPriceController,
                        onChanged: (v){
                          print('min ans max value ${_minPriceController.text} and ${_maxPriceController.text}');
                          },
                          firsttxt: "PRICE",
                          secondtxt: " RANGE",
                          devicewidth: devicewidth,
                          currentRangeValues: Filtervalues.Filtervalues,
                          onpressed: (RangeValues values) {
                            print('selected Range ${values.start}, ${values.end}');
                            if (values != null) {
                               _minPriceController.text = values.start.toString();
                               _maxPriceController.text = values.end.toString();
                              Provider.of<exploreFiltervalues>(context, listen: false).getFiltervalues(values);
                            } else {
                              print('value is null');
                            }
                          });
                    },
                  ),
                      TopBy(
                      devicewidth: devicewidth,
                      firsttxt: "TOP",
                      secondtxt: " BY",
                      isToggleneed: true),

               /*   Consumer<exploreFilterToBy>(
                    builder: (context, FiltervaluesTB, child) {
                      return CustomRangeSlider(
                          firsttxt: "RETURNS",
                          secondtxt: " PERCENTAGE",
                          devicewidth: devicewidth,
                          currentRangeValues: FiltervaluesTB._FiltervaluesTB,
                          onpressed: (RangeValues values) {
                            print('selected Range ${values.start}, ${values.end}');

                            if (values != null) {
                              Provider.of<exploreFilterToBy>(context, listen: false)
                                  .getFiltervaluesTB(values);
                            } else {
                              print('value is null');
                            }
                          });
                    },
                  ),*/

                //  TimeFrame(devicewidth),
                 /* Consumer<exploreFilterSF>(
                    builder: (context, FiltervaluesSF, child) {
                      return CustomRangeSlider(
                          firsttxt: "SAFETY",
                          secondtxt: " FACTOR",
                          devicewidth: devicewidth,
                          currentRangeValues: FiltervaluesSF._FiltervaluesSF,
                          onpressed: (RangeValues values) {
                            print('selected Range ${values.start}, ${values.end}');

                            if (values != null) {
                              Provider.of<exploreFilterSF>(context, listen: false)
                                  .getFiltervaluesSF(values);
                            } else {
                              print('value is null');
                            }
                          });
                    },
                  ),*/

                  SortbyRating(devicewidth, context," USER RATING"),
                  SortbyRating(devicewidth, context," SAUDA RATING"),
                  Container (
                    height: 100,
                    width: devicewidth,
                   // color: Colors.redAccent,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0,top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: CustomTextStyle.txt24Rbblack,
                              children: <TextSpan>[
                                TextSpan(text: "SORT BY"),
                                TextSpan(text: " PRICE", style: CustomTextStyle.txt24Rlblk),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 18.0,
                              top: 15,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: InkWell(
                                        onTap: () {
                                          Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF6(true);
                                          Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF7(false);
                                          },
                                        child: ContainerButton2(
                                            devicewidth: 150,
                                            buttonname: "Highest Rated First",
                                            stars: "SBR"),)),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: InkWell(
                                        onTap: () {
                                          Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF6(false);
                                          Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF7(true);
                                          },
                                        child: ContainerButton2(
                                            devicewidth: 150,
                                            buttonname: "Lowest Rated First",
                                            stars: "SBR2"))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                      Consumer<FilterPriceSelect>(
                        builder: (context,ratingVM,child) {
                     return ParallelButtons(
                            btn1clr: Appcolors.splashbgcolor,
                            btn1txtclr: Appcolors.black,
                            btn2clr: Appcolors.white,
                            btn2txtclr: Appcolors.black,
                            fontFamily: "Roboto-Regular",
                            fontSize: 14 ,
                            devicewidth: devicewidth,
                            btn1name: "Apply",
                            btn2name: "Clear all",
                            btn1onpressed: () {
                              print('Apply filter values selected '
                                  'cat id :${filterCat}, '
                                  'min price : ${_minPriceController.text} '
                                  'max price: ${_maxPriceController.text}'
                                  'city: ${cityVM.UserCityExpFilter?.name}\n'
                                  'proffession: ${cityVM.UserProfessionExpFilter?.name}'
                                  'user rating: ${ checkRating(ratingVM)}'
                                  ' sauda rating ${ checkSaudaRating(ratingVM)}'
                                  'sort by price : ${checkSortByPrice(ratingVM)}'
                              );
                              _professionViewModel.setUserMinPriceExFilter(_minPriceController.text);
                              _professionViewModel.setUserMaxPriceExFilter(_maxPriceController.text);
                              _professionViewModel.setUserRatingExFilter(checkRating(ratingVM));
                              _professionViewModel.setSaudaRatingExFilter(checkSaudaRating(ratingVM));
                              _professionViewModel.setSortByPriceExFilter(checkSortByPrice(ratingVM));
                              //_commonProvider.ExploreCatId
                              _exploreViewModel.exploreapi(
                                onFailureRes: onFailureRes,
                                onSuccessRes: onSuccessRes,
                                catID: filterCat,
                                PageNo: "",
                                pricemin: _minPriceController.text,
                                pricemax: _maxPriceController.text,
                                sortbyprice: checkSortByPrice(ratingVM),
                                sortbysaudarating: checkSaudaRating(ratingVM),
                                sortbyuserrating: checkRating(ratingVM),
                                type: "city",
                                top: cityVM.UserCityExpFilter?.name,
                                isFilter: true
                              );
                        },
                            btn2onpressed: () {
                              Navigator.pop(context);
                            });}
                      ),
                ]),
              );
                 }
            ),
          ));
        }
    );
  }

  Container SortbyRating(double devicewidth, BuildContext context,String sortbytitle) {
    return Container(
                height: 180,
                width: devicewidth,
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, top: 10, right: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: CustomTextStyle.txt24Rbblack,
                          children: <TextSpan>[
                            TextSpan(text: "SORT BY"),
                            TextSpan(
                                text: sortbytitle,
                                style: CustomTextStyle.txt24Rlblk),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          top: 15,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: InkWell(
                                    onTap: () {

                                      if(sortbytitle == " USER RATING"){
                                        Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF(true);
                                        Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF2(false);
                                        Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF3(false);
                                        Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF4(false);
                                        Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF5(false);
                                      }else{
                                        Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating1(true);
                                        Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating2(false);
                                        Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating3(false);
                                        Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating4(false);
                                        Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating5(false);
                                      }
                                      },
                                    child: ContainerButton(
                                      ratingType: sortbytitle == " USER RATING" ? "userrating" : "saudarating",
                                        devicewidth: 150,
                                        buttonname: "Highest Rated First",
                                        stars: "HRF"))),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 1,
                                child: InkWell(
                                    onTap: () {

                                      if(sortbytitle == " USER RATING"){
                                        Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF(false);
                                        Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF2(true);
                                        Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF3(false);
                                        Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF4(false);
                                        Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF5(false);
                                      }else{
                                        Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating1(false);
                                        Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating2(true);
                                        Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating3(false);
                                        Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating4(false);
                                        Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating5(false);
                                      }

                                      },
                                    child: ContainerButton(
                                        ratingType: sortbytitle == " USER RATING" ? "userrating" : "saudarating",
                                        devicewidth: 150,
                                        buttonname: "Lowest Rated First",
                                        stars: "LRF"))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 15),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: (){
                                    if(sortbytitle == " USER RATING"){
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF(false);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF2(false);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF3(true);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF4(false);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF5(false);
                                    }else{
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating1(false);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating2(false);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating3(true);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating4(false);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating5(false);
                                    }
                                  },
                                  child: ContainerButton(
                                    ratingType: sortbytitle == " USER RATING" ? "userrating" : "saudarating",
                                    devicewidth: 102,
                                    buttonname: "& above",
                                    stars: "3",
                                  ),
                                )),
                            SizedBox(
                              width: 0,
                            ),
                            Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: (){
                                    if(sortbytitle == " USER RATING"){
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF(false);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF2(false);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF3(false);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF4(true);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF5(false);
                                    }else{
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating1(false);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating2(false);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating3(false);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating4(true);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating5(false);
                                    }
                                  },
                                  child: ContainerButton(
                                    ratingType: sortbytitle == " USER RATING" ? "userrating" : "saudarating",
                                    devicewidth: 90,
                                    buttonname: "& above",
                                    stars: "2",
                                  ),
                                )),
                            SizedBox(
                              width: 0,
                            ),
                            Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: (){
                                    if(sortbytitle == " USER RATING"){
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF(false);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF2(false);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF3(false);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF4(false);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterPriceSelectF5(true);
                                    }else{
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating1(false);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating2(false);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating3(false);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating4(false);
                                      Provider.of<FilterPriceSelect>(context, listen: false).getFilterSaudaRating5(true);
                                    }
                                  },
                                  child: ContainerButton(
                                    ratingType: sortbytitle == " USER RATING" ? "userrating" : "saudarating",
                                    devicewidth: 80,
                                    buttonname: "& above",
                                    stars: "1",
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
  }

  Container TimeFrame(double devicewidth) {
    return Container(
              height: 150,
              width: devicewidth,
              color: Appcolors.white,
              child: ClipRect(
                clipper: TopBorderClipper(20.0),
                child: DottedBorder(
                  dashPattern: [8, 4],
                  strokeWidth: 1,
                  color: Appcolors.kyctxtgrey,
                  strokeCap: StrokeCap.square,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            style: CustomTextStyle.txt24Rbblack,
                            children: <TextSpan>[
                              TextSpan(text: "TIMEFRAME"),
                              TextSpan(
                                  text: " EST",
                                  style: CustomTextStyle.txt24Rlblk),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Consumer<TrendingDropOptions2>(
                            builder: (context, trendingoptions2, child) {
                              return CustomDropdown(
                                underlinecolor: Appcolors.txtlitegreen2,
                                iconcolor: Appcolors.txtlitegreen2,
                                textdecoration: CustomTextStyle.txt24Rmtxtblkf,
                                devicewidth: 90,
                                selectedValue: trendingoptions2.trengingdropoptions2,
                                options: [
                                  "Madurai",
                                  "Coimbatore",
                                  "Chennai",
                                  "Trichy"
                                ],
                                onChanged: (value) {
                                  if (value != null) {
                                    Provider.of<TrendingDropOptions2>(context,
                                            listen: false)
                                        .getTrendingDropOPtions2(value);
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
                  ),
                ),
              ),
            );
  }

  ContainerButton2({required double devicewidth, required String buttonname, required String stars}) {

    return stars =="SBR"? Row(
        children: [
          Consumer<FilterPriceSelect>(
              builder: (context, FilterPrice6, child) {
                return Container(
                  height: 40,
                  width: devicewidth,
                  decoration: BoxDecoration(
                      color: FilterPrice6.FilterPriceSelectF6 ? Appcolors.splashbgcolor2 : Appcolors.white,
                      border:
                      Border.all(color: Appcolors.black, width: 1),
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(buttonname,
                          style: CustomTextStyle.txt14Rmtxtblk,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                );
              }),
        ],
      )
        : Row(
            children: [
              Consumer<FilterPriceSelect>(
                  builder: (context, FilterPrice7, child) {
                return Container(
                  height: 40,
                  width: devicewidth,
                  decoration: BoxDecoration(
                      color: FilterPrice7.FilterPriceSelectF7 ? Appcolors.splashbgcolor2 : Appcolors.white,
                      border: Border.all(color: Appcolors.black, width: 1),
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(buttonname,
                          style: CustomTextStyle.txt14Rmtxtblk,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                );
              }),
            ],
          );
  }

  checkRating(FilterPriceSelect ratingVM) {
    if(ratingVM._FilterPriceSelectF){
      return "5";
    }else if(ratingVM._FilterPriceSelectF2){
      return "1";
    }else if(ratingVM._FilterPriceSelectF3){
      return "4";
    }else if(ratingVM._FilterPriceSelectF4){
      return "3";
    }else if(ratingVM._FilterPriceSelectF5){
      return "2";
    }else{
      print('check rating error');
    }

  } checkSaudaRating(FilterPriceSelect ratingVM) {
    if(ratingVM.FilterSaudaRating1){
      return "5";
    }else if(ratingVM.FilterSaudaRating2){
      return "1";
    }else if(ratingVM.FilterSaudaRating3){
      return "4";
    }else if(ratingVM.FilterSaudaRating4){
      return "3";
    }else if(ratingVM.FilterSaudaRating5){
      return "2";
    }else{
      print('check rating error');
    }

  }

  checkSortByPrice(FilterPriceSelect ratingVM) {
    if(ratingVM._FilterPriceSelectF6){
      return "high";
    }else if(ratingVM._FilterPriceSelectF7){
      return "low";
    }else{
      print('check rating error');
    }
  }

  onFailureRes(String p1) {
  }

  onSuccessRes(ExploreModel? p1) {
    print('on filter ex success');
   // _commonProvider.setIsFilterApi(false);
    _commonProvider.setIsFilterApi(true);
    Navigator.pop(context);
  }
}





class exploreFiltervalues with ChangeNotifier {
  RangeValues _Filtervalues = RangeValues(1, 30000000);

  RangeValues get Filtervalues => _Filtervalues;

  void getFiltervalues(RangeValues pcd) {
    _Filtervalues = pcd;
    notifyListeners();
  }
}

class exploreFilterToBy with ChangeNotifier {
  RangeValues _FiltervaluesTB = RangeValues(1, 100);

  RangeValues get FiltervaluesTB => _FiltervaluesTB;

  void getFiltervaluesTB(RangeValues pcd) {
    _FiltervaluesTB = pcd;
    notifyListeners();
  }
}

class exploreFilterSF with ChangeNotifier {
  RangeValues _FiltervaluesSF = RangeValues(1, 100);

  RangeValues get FiltervaluesTB => _FiltervaluesSF;

  void getFiltervaluesSF(RangeValues pcd) {
    _FiltervaluesSF = pcd;
    notifyListeners();
  }
}

class FilterPriceSelect with ChangeNotifier {
  bool _FilterPriceSelectF = false;
  bool _FilterPriceSelectF2 = false;
  bool _FilterPriceSelectF3 = false;
  bool _FilterPriceSelectF4 = false;
  bool _FilterPriceSelectF5 = false;
  bool _FilterPriceSelectF6 = false;
  bool _FilterPriceSelectF7 = false;

  bool _FilterSaudaRating1 = false;
  bool _FilterSaudaRating2 = false;
  bool _FilterSaudaRating3 = false;
  bool _FilterSaudaRating4 = false;
  bool _FilterSaudaRating5 = false;
  bool _FilterSaudaRating6 = false;
  bool _FilterSaudaRating7 = false;

  bool get FilterPriceSelectF => _FilterPriceSelectF;
  bool get FilterPriceSelectF2 => _FilterPriceSelectF2;
  bool get FilterPriceSelectF3 => _FilterPriceSelectF3;
  bool get FilterPriceSelectF4 => _FilterPriceSelectF4;
  bool get FilterPriceSelectF5 => _FilterPriceSelectF5;
  bool get FilterPriceSelectF6 => _FilterPriceSelectF6;
  bool get FilterPriceSelectF7 => _FilterPriceSelectF7;

  bool get FilterSaudaRating1 => _FilterSaudaRating1;
  bool get FilterSaudaRating2 => _FilterSaudaRating2;
  bool get FilterSaudaRating3 => _FilterSaudaRating3;
  bool get FilterSaudaRating4 => _FilterSaudaRating4;
  bool get FilterSaudaRating5 => _FilterSaudaRating5;
  bool get FilterSaudaRating6 => _FilterSaudaRating6;
  bool get FilterSaudaRating7 => _FilterSaudaRating7;


  void getFilterSaudaRating1(bool pcd) {
    _FilterSaudaRating1 = pcd;
    notifyListeners();
  }
  void getFilterSaudaRating2(bool pcd) {
    _FilterSaudaRating2 = pcd;
    notifyListeners();
  }
  void getFilterSaudaRating3(bool pcd) {
    _FilterSaudaRating3 = pcd;
    notifyListeners();
  }
  void getFilterSaudaRating4(bool pcd) {
    _FilterSaudaRating4 = pcd;
    notifyListeners();
  }
  void getFilterSaudaRating5(bool pcd) {
    _FilterSaudaRating5 = pcd;
    notifyListeners();
  }
  void getFilterSaudaRating6(bool pcd) {
    _FilterSaudaRating6 = pcd;
    notifyListeners();
  }
  void getFilterSaudaRating7(bool pcd) {
    _FilterSaudaRating7 = pcd;
    notifyListeners();
  }


  void getFilterPriceSelectF(bool pcd) {
    _FilterPriceSelectF = pcd;
    notifyListeners();
  }
  void getFilterPriceSelectF2(bool pcd) {
    _FilterPriceSelectF2 = pcd;
    notifyListeners();
  }
  void getFilterPriceSelectF3(bool pcd) {
    _FilterPriceSelectF3 = pcd;
    notifyListeners();
  }
  void getFilterPriceSelectF4(bool pcd) {
    _FilterPriceSelectF4 = pcd;
    notifyListeners();
  }
  void getFilterPriceSelectF5(bool pcd) {
    _FilterPriceSelectF5 = pcd;
    notifyListeners();
  }
  void getFilterPriceSelectF6(bool pcd) {
    _FilterPriceSelectF6 = pcd;
    notifyListeners();
  }
  void getFilterPriceSelectF7(bool pcd) {
    _FilterPriceSelectF7 = pcd;
    notifyListeners();
  }
}

class FilterPriceSelect2 with ChangeNotifier {
  bool _FilterPriceSelectF2 = false;

  bool get FilterPriceSelectF2 => _FilterPriceSelectF2;

  void getFilterPriceSelectF2(bool pcd) {
    _FilterPriceSelectF2 = pcd;
    notifyListeners();
  }
}

class FilterPriceSelect3 with ChangeNotifier {
  bool _FilterPriceSelectF3 = false;

  bool get FilterPriceSelectF3 => _FilterPriceSelectF3;

  void getFilterPriceSelectF3(bool pcd) {
    _FilterPriceSelectF3 = pcd;
    notifyListeners();
  }
}

class FilterPriceSelect4 with ChangeNotifier {
  bool _FilterPriceSelectF4 = false;

  bool get FilterPriceSelectF4 => _FilterPriceSelectF4;

  void getFilterPriceSelectF4(bool pcd) {
    _FilterPriceSelectF4 = pcd;
    notifyListeners();
  }
}

class FilterPriceSelect5 with ChangeNotifier {
  bool _FilterPriceSelectF5 = false;

  bool get FilterPriceSelectF5 => _FilterPriceSelectF5;

  void getFilterPriceSelectF5(bool pcd) {
    _FilterPriceSelectF5 = pcd;
    notifyListeners();
  }
}

class FilterPriceSelect6 with ChangeNotifier {
  bool _FilterPriceSelectF6 = false;

  bool get FilterPriceSelectF6 => _FilterPriceSelectF6;

  void getFilterPriceSelectF6(bool pcd) {
    _FilterPriceSelectF6 = pcd;
    notifyListeners();
  }
}

class FilterPriceSelect7 with ChangeNotifier {
  bool _FilterPriceSelectF7 = false;

  bool get FilterPriceSelectF7 => _FilterPriceSelectF7;

  void getFilterPriceSelectF7(bool pcd) {
    _FilterPriceSelectF7 = pcd;
    notifyListeners();
  }
}
