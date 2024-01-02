import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../constants/local_images.dart';
import '../../../data/models/Explore_model/ExploreDetailModel.dart';
import '../../../data/models/Explore_model/ExploreModel.dart';
import '../../../data/models/StatusandMessageModel.dart';
import '../../../ui/explore/exploreDetail.dart';
import '../../../ui/explore/exploreFilter.dart';
import '../../../utils/CustomBorderClipper.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/common_textstyles.dart';
import '../../../viewModel/CommonProvider.dart';
import '../../../viewModel/base_view_model/base_view_model.dart';
import '../../../viewModel/buy_Sell_viewmodel.dart';
import '../../../viewModel/explore_view_model.dart';
import '../../../viewModel/profile_view_model.dart';
import '../../button_widgets/common_button.dart';
import '../../dropdown_widgets/common_dropdown.dart';
import '../../dropdown_widgets/dropdown_withimage.dart';
import '../../loading_widgets/loader.dart';
import '../../textfields_widgets/common_textfield_withicon.dart';
import '../../textfields_widgets/textfieldwithborder.dart';
import '../BuySellSmall.dart';

class PropertiesForm extends StatefulWidget {
  Stocks? selectedstocks;
  bool isExplore;
  Stockss? stocksviewdata;
  Function(StatusandMessageModel?) onBuySuccess;
  PropertiesForm({
    required this.isExplore,
    required this.selectedstocks,
    required this.onBuySuccess,
    required this.stocksviewdata,
    super.key,
  });

  @override
  State<PropertiesForm> createState() => _PropertiesFormState();
}

class _PropertiesFormState extends State<PropertiesForm> {
  Stocks? get _selectedstocks => widget.selectedstocks;
  Stockss? get _selectedstockViewData => widget.stocksviewdata;
  late CommonProvider _commonProvider;
  late FilterPriceSelect6 _individualvalueprovider;
  late FilterPriceSelect7 _compnyvalueprovider;
  late buystockbutn _purchaseType;
  late BuySellViewModel _buysellprovider;
  late ProfileViewModel _profileViewModel;
  late ExploreViewModel _exploreViewModel;
  String SelectedStockName = "";
  String SelectedStockID = "";
  String? _selectedOption = 'Indian Resident';
  TextEditingController _usersharecontroller = TextEditingController();
  TextEditingController _AppxBudgetcontroller = TextEditingController();
  TextEditingController _timeframecontroller = TextEditingController();
  TextEditingController _userpricecontroller = TextEditingController();
  TextEditingController _usermessgaecontroller = TextEditingController();
  TextEditingController _userexpectcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _exploreViewModel = Provider.of<ExploreViewModel>(context, listen: false);
    _commonProvider = Provider.of<CommonProvider>(context, listen: false);
    _individualvalueprovider = Provider.of<FilterPriceSelect6>(context, listen: false);
    _compnyvalueprovider = Provider.of<FilterPriceSelect7>(context, listen: false);
    _purchaseType = Provider.of<buystockbutn>(context, listen: false);
    _buysellprovider = Provider.of<BuySellViewModel>(context, listen: false);
    _profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _commonProvider.setShareQty("");
      _commonProvider.setSharePrice("");
      _individualvalueprovider.getFilterPriceSelectF6(false);
      _compnyvalueprovider.getFilterPriceSelectF7(false);
      _commonProvider.setStockMessage("");
      _commonProvider.setStockExpect("");
    });
    print('Buy Sell Selected stock name  ${_selectedstocks?.name} id ${_selectedstocks?.id} catid ${_selectedstocks?.categoryId.toString()}');
    _usersharecontroller = TextEditingController(text: _commonProvider.ShareQty);
    _userpricecontroller = TextEditingController(text: _commonProvider.SharePrice);

  }

  @override
  Widget build(BuildContext context) {

    TextEditingController _textEditingController =TextEditingController();
    final TextEditingController _useremailcontroller = TextEditingController();
    final TextEditingController _usernamecontroller = TextEditingController();
    final TextEditingController _usernumcontroller = TextEditingController();

    _useremailcontroller.text ="${_profileViewModel.profileResponseModel?.user?.email ?? ""}";
    _usernamecontroller.text ="${_profileViewModel.profileResponseModel?.user?.name ?? ""}";
    _usernumcontroller.text ="${_profileViewModel.profileResponseModel?.user?.mobile ?? ""}";
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;


    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Form(
      key: _formKey,
      child: Container(
        height: deviceheight,
        //   height: deviceheight-100,
        width: devicewidth,
        decoration: BoxDecoration(
          //  color: Colors.green.shade100,
          // color: Appcolors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23.0),
              topRight: Radius.circular(23.0),
            )),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 25, right: 18),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: devicewidth,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(23.0),
                            topRight: Radius.circular(23.0),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close, color: Appcolors.black, size: 25,))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: devicewidth,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // color: Colors.red,
                            child: Column(
                              children: [
                                Text("Buy Sell with us",
                                  style: CustomTextStyle.txt24Rbblack,
                                ),
                                Container(
                                  width: devicewidth/2,
                                  child: Divider(
                                    color: Appcolors.txtpurple,
                                  ),
                                ),
                                Text(_selectedstockViewData?.category?.categoryName ?? "",
                                  style: CustomTextStyle.txt18Rltxtpur,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(

                      width: devicewidth,
                      //  color: Colors.redAccent.withOpacity(0.4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: CustomTextStyle.txt24Rbblack,
                              children: <TextSpan>[
                                TextSpan(text: "STOCK"),
                                TextSpan(
                                    text: " DETAILS",
                                    style: CustomTextStyle.txt24Rlblk),
                              ],
                            ),
                          ),
                          SizedBox(height: 16,),
                          Container(
                            height: 70,
                            width: devicewidth,
                            //       color: Colors.red.shade100,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 0, right: 0),
                                  child: DropdownWithImageSelection(
                                    isExploreDetail:widget.isExplore,
                                    devicewidth: devicewidth,
                                    onItemSelected2: (selectedItem) {
                                      // Handle the selected item here
                                      print('Selected Item: ${selectedItem?.name}');
                                      SelectedStockName = selectedItem?.name ?? "";
                                      SelectedStockID = selectedItem?.id.toString() ?? "";
                                      },
                                      selectedStocks: _selectedstocks
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Consumer<buystockbutn>(
                              builder: (context, buystock, child) {
                                return SmallParallelBtn(
                                  b1pressed: (){
                                    Provider.of<buystockbutn>(context, listen: false).setBuy(true);
                                    Provider.of<buystockbutn>(context, listen: false).setsell(false);
                                  },
                                  b2pressed: (){
                                    Provider.of<buystockbutn>(context, listen: false).setBuy(false);
                                    Provider.of<buystockbutn>(context, listen: false).setsell(true);
                                  },
                                  devicewidth: devicewidth,
                                  b1hg: 30,
                                  b1wd: 60,
                                  b1txt: "Buy",
                                  b2txt: "Sell",
                                  b2hg: 30,
                                  b2wd: 60,
                                  buy:buystock.buy,
                                  sell:buystock.sell,
                                  titletxt: "what do you wish to do?",buysell: buystock.buystock,);
                              }),
                          SizedBox(height: 16,),
                          NumOfShare(devicewidth, _AppxBudgetcontroller,"Approx Budget or Expectations",'Budget/Expectations',true),
                          SizedBox(height: 16,),
                        Container(
                         // height: 150,
                          width: devicewidth,
                      //    color: Colors.red.shade100,
                          child: Row(
                            children: [
                              Expanded(
                                  flex:2,
                                  child: Text("Timeframe to buy", style:CustomTextStyle.txt16Rb400gry,)),
                              Text(": ",style:CustomTextStyle.txt16Rb400gry,),
                              Expanded(
                                  flex:1,
                                  child: TextFormField(
                                    controller: _timeframecontroller,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter this field.';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 0), // Adjust vertical padding
                                  ),)),
                              Expanded(
                                  flex:1,
                                  child: Text("in month",style:CustomTextStyle.txt16Rb400gry,))
                            ],
                          ),
                        ),
                          SizedBox(height: 16,),
                        Consumer<buystockbutn>(
                            builder: (context, legalyes, child) {
                              return CommonUIRow(
                                text: "Legal help needed?",
                                onYesPressed: () {
                                  legalyes.setlegalyes(true);
                                  legalyes.setlegalno(false);
                                },
                                onNoPressed: () {
                                  legalyes.setlegalyes(false);
                                  legalyes.setlegalno(true);
                                },
                                selectbtn: legalyes.legalyes,
                              );
                            }
                          ),
                          SizedBox(height: 24,),
                          Consumer<buystockbutn>(
                              builder: (context, legalyes, child) {
                                return CommonUIRow(
                                  text: "Property Dealer / Ad user needed",
                                  onYesPressed: () {
                                    legalyes.setPropDealerYes(true);
                                    legalyes.setPropDealerNo(false);
                                  },
                                  onNoPressed: () {
                                    legalyes.setPropDealerYes(false);
                                    legalyes.setPropDealerNo(true);
                                  },
                                  selectbtn: legalyes.legalno,
                                );
                              }
                          ),
                          SizedBox(height: 24,),
                          Container(
                            //   color: Colors.red,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text("Nationality :", style: CustomTextStyle.txt16Rb400gry),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: CustomDropdown(
                                    dropdwnicon: LocalSVGImages.dropdwn,
                                    underlinecolor: Appcolors.kyctxtgrey,
                                    iconcolor: Appcolors.kyctxtgrey,
                                    // textdecoration: CustomTextStyle.txt16kyctxtgrey,
                                    textdecoration: CustomTextStyle.txt16Rb,
                                    devicewidth:devicewidth/2+10,
                                    selectedValue: _selectedOption ?? "",
                                    options: ['Indian Resident', 'NRI', 'Foreigner'],
                                    onChanged: (value) {
                                            setState(() {
                                             _selectedOption = value;
                                                 });
                                            print('selected nation $_selectedOption');
                                    },
                                  ),
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    Container(
                        height: 15,
                        width: devicewidth,
                        child:  ClipRect(
                            clipper: TopBorderClipper(20.0),
                            child: DottedBorder(
                                dashPattern: [8, 4],
                                strokeWidth: 1,
                                color: Appcolors.kyctxtgrey,
                                strokeCap: StrokeCap.square,
                                borderType: BorderType.RRect,
                                radius: Radius.circular(0),
                                child: Container() ))),
                    Container(
                      width: devicewidth,
                      // color: Colors.green.shade100,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                style: CustomTextStyle.txt24Rbblack,
                                children: <TextSpan>[
                                  TextSpan(text: "PERSONAL"),
                                  TextSpan(
                                      text: " DETAILS",
                                      style: CustomTextStyle.txt24Rlblk),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text("Your details are autofilled from your KYC",style: CustomTextStyle.txt12Rb400gry,),
                            SizedBox(height: 35,),
                            Container(
                              height: 45,
                              child: CustomTextFieldicon(
                                enabled: false,
                                localsvg: LocalSVGImages.usergreen,
                                labeliconUnselected: LocalSVGImages.usergrey,
                                textInputType: TextInputType.name,
                                txtalign: TextAlign.left,
                                onChanged: (value){},
                                labelicon: Icons.person,
                                hintText: '',
                                controller: _usernamecontroller,
                              ),
                            ),
                            SizedBox(height: 15,),
                            Container(
                              height: 45,
                              child: CustomTextFieldicon(
                                enabled: false,
                                localsvg: LocalSVGImages.emailgreen,
                                labeliconUnselected: LocalSVGImages.emailgrey,
                                textInputType: TextInputType.emailAddress,
                                txtalign: TextAlign.left,
                                onChanged: (value){},
                                labelicon: Icons.email_outlined,
                                hintText: '',
                                controller: _useremailcontroller,
                              ),
                            ),
                            SizedBox(height: 15,),
                            Container(
                              height: 45,
                              child: CustomTextFieldicon(
                                enabled: false,
                                localsvg: LocalSVGImages.mobilegrey,
                                labeliconUnselected: LocalSVGImages.mobilegrey,
                                textInputType: TextInputType.number,
                                txtalign: TextAlign.left,
                                onChanged: (value){},
                                labelicon: Icons.mobile_screen_share_sharp,
                                hintText: '',
                                controller: _usernumcontroller,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Are you an individual or company?",style: CustomTextStyle.txt16Rb400gry,),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            onTap: () {
                                              Provider.of<FilterPriceSelect6>(context, listen: false).getFilterPriceSelectF6(true);
                                              Provider.of<FilterPriceSelect7>(context, listen: false).getFilterPriceSelectF7(false);

                                            },
                                            child: ContainerButton2(
                                                devicewidth: 150,
                                                buttonname: "Individual",
                                                stars: "SBR"),)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: InkWell(
                                              onTap: () {
                                                Provider.of<FilterPriceSelect6>(context, listen: false).getFilterPriceSelectF6(false);
                                                Provider.of<FilterPriceSelect7>(context, listen: false).getFilterPriceSelectF7(true);

                                              },
                                              child: ContainerButton2(
                                                  devicewidth: 150,
                                                  buttonname: "Company",
                                                  stars: "SBR2"))),
                                      Expanded(
                                        flex: 1,
                                        child: Container(),)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            iExpect("Please let us know if you have any mandate or price request/expectation","I expect...",_userexpectcontroller,false),
                            SizedBox(height: 24),
                            iExpect("Additional Message for us, if any?","Iam new to investing...",_usermessgaecontroller,true),
                            SizedBox(height: 24),
                            Container(
                              width: devicewidth,
                              //  color: Colors.red,
                              child: Column(
                                children: [
                                  Consumer<BuySellViewModel>(
                                      builder: (context, buyselvm, child) {
                                        return buyselvm.state == ViewState.busy ? Loader():Container(
                                          height: 44,
                                          //width: 190,
                                          child:  Consumer<buystockbutn>(
                                            builder: (context, legalyes, child) {
                                              return CustomMaterialButton(
                                                text: 'Submit to Sauda',
                                                onPressed: () {
                                                  //  context.router.push(Saudahomepage());

                                                  /*"stock_id":12, ---
                                            "category_id":1, ----
                                            "company_name":"Api Holding",  ---
                                            "quantity":10,----
                                            "purpose_type":"individual",
                                            "purchase_type":"buy",
                                            "message":"testing",
                                            "guidance":true,
                                            "price":500 ---   */


                                                  Map<String,
                                                      dynamic> buysellparam = {
                                                    "stock_id": "${getSelectedStockId(_selectedstocks?.id)}",
                                                    "category_id": " ${_selectedstocks?.categoryId.toString()}",
                                                    "company_name": "${getSelectedStockName(_selectedstocks?.name)}",
                                                    "approx_budget": "${_AppxBudgetcontroller.text}",
                                                    "timeframe": "${_timeframecontroller.text}",
                                                    "help_need": "${legalyes.legalyes ? "yes" : "no"}",
                                                    "property_dealer": "${legalyes.PropDealeryes ? "yes" : "no"}",
                                                    "nationality": _selectedOption,
                                                    "purpose_type": "${getPurposeType()}",
                                                    "purchase_type": "${_purchaseType.buy ? "buy" : "sell"}",
                                                    "message": "${_commonProvider.StockMessage}",
                                                    "quantity": "0",
                                                    "guidance": true,
                                                    "price": "0",//  no need
                                                  };

                                                  print('buysellparam ---- ${buysellparam}');


                                                  if (_formKey.currentState!.validate()) {
                                                    if (_selectedstocks?.id != null && _selectedstocks?.categoryId != null && _selectedstocks?.name != null) {
                                                      if (_commonProvider
                                                          .StockMessage == "" ||
                                                          getPurposeType() == "") {
                                                        showToast(
                                                            "Enter all Fields.");
                                                      } else {
                                                         _buysellprovider.buysellapi(
                                                          onFailureRes: onFailureRes,
                                                          onSuccessRes: onSuccessRes,
                                                          buysellparams: buysellparam);
                                                      }
                                                    }
                                                  }

                                                  print('Button pressed!');
                                                },
                                              );
                                            }
                                          ),
                                        );
                                      }
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }

  Container iExpect(String title,String description,TextEditingController controller, bool isMessage) {
    return Container(

      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                title,
                style: CustomTextStyle.txt16Rb400gry
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: controller,
              maxLines: 5, // Allow the TextField to have multiple lines
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(width: 1, color: Appcolors.kyctxtgrey), //<-- SEE HERE

                ),
                focusedBorder: OutlineInputBorder(

                  borderSide: BorderSide(
                      width: 1, color: Appcolors.splashbgcolor2),
                ),
                hintText: description,
                hintStyle: TextStyle(fontFamily: "Roboto-LightItalic",fontSize: 16),
                border: OutlineInputBorder(

                ),
              ),
              onChanged: (value){
                isMessage? _commonProvider.setStockMessage(value) : _commonProvider.setStockExpect(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Container NumOfShare(double devicewidth, TextEditingController _textEditingController,String title,String labeltxt,bool isShareQty) {
    return Container(

      width: devicewidth,
      //   color: Colors.green,
      child: Padding(
        padding:  const EdgeInsets.only(top: 8.0, left: 18, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title, style: CustomTextStyle.txt16Rb400gry,),
            SizedBox(height: 10,),
            Container(
              height: 50,
              width: devicewidth/2,
              //   color: Colors.redAccent.shade100,
              child: CustomOutlinedTextField(
                controller: _textEditingController,
                labelText: labeltxt,
                hintText: '',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  isShareQty? _commonProvider.setShareQty(value):_commonProvider.setSharePrice(value);
                },

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter this field.';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  getPurposeType() {
    if(!_individualvalueprovider.FilterPriceSelectF6 && !_compnyvalueprovider.FilterPriceSelectF7){
      return "";
    }else if(_compnyvalueprovider.FilterPriceSelectF7){
      return "company";
    }else{
      return "individual";
    }

  }

  onFailureRes(String p1) {
  }

  onSuccessRes(StatusandMessageModel? p1) {
    _commonProvider.setShareQty("");
    _commonProvider.setSharePrice("");
    _individualvalueprovider.getFilterPriceSelectF6(false);
    _compnyvalueprovider.getFilterPriceSelectF7(false);
    _commonProvider.setStockMessage("");
    _commonProvider.setStockExpect("");
    if(_purchaseType.buy){
      showToast("Requested admin to Buy");
      // Navigator.pop(context);

      return widget.onBuySuccess(p1);
    }else{
      showToast("Requested admin to Sell");
      // Navigator.push(context, MaterialPageRoute(builder: (context) => DealerVerifyPending()));
      return widget.onBuySuccess(p1);
    }

    Navigator.pop(context);
  }

  getSelectedStockId(int? ExploreStockid) {
    if(SelectedStockID.isNotEmpty){
      return SelectedStockID;
    }else{
      return ExploreStockid;
    }
  }

  getSelectedStockName(String? ExploreStockName) {
    if(SelectedStockName.isNotEmpty){
      return SelectedStockName;
    }else{
      return ExploreStockName;
    }
  }

  onExpSuccessRes(ExploreModel? p1) {
  }
}


class CommonUIRow extends StatelessWidget {
  final String text;
  final bool selectbtn;
  final VoidCallback onYesPressed;
  final VoidCallback onNoPressed;

  CommonUIRow({
    required this.text,
    required this.selectbtn,
    required this.onYesPressed,
    required this.onNoPressed,
  });

  @override
  Widget build(BuildContext context) {


    return Consumer<buystockbutn>(
        builder:(context,legalbtn,child) {
          print('yes::: ${legalbtn.legalyes}');
          print('no::: ${legalbtn.legalno}');

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 2,
                  child: Text(text, style: CustomTextStyle.txt16Rb400gry)),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 30,
                      width: 60,
                      child: MaterialButton(
                        onPressed: onYesPressed,
                        child: Text(
                          "Yes",
                          //   style: TextStyle(fontSize: fontSize, fontFamily: fontFamily),
                        ),
                        color: setColorYes(text,legalbtn) ? Appcolors.splashbgcolor : Appcolors.white,
                        textColor: Appcolors.black,
                        minWidth: 200.0,
                        height: 48.0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Appcolors.black, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      )),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 30,
                      width: 60,
                      child: MaterialButton(
                        onPressed: onNoPressed,
                        child: Text(
                          "No",
                          //   style: TextStyle(fontSize: fontSize, fontFamily: fontFamily),
                        ),
                        color: setColorNo(text,legalbtn)
                            ? Appcolors.splashbgcolor
                            : Appcolors.white,
                        textColor: Appcolors.black,
                        minWidth: 200.0,
                        height: 48.0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Appcolors.black, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      )),
                ),
              ),
            ],
          );
        }
    );
  }
  setColorYes(String text, buystockbutn legalbtn) {

    if(text == "Legal help needed?"){
      return legalbtn.legalyes;
  }else {
      return legalbtn.PropDealeryes;
    }

  }  setColorNo(String text, buystockbutn legalbtn) {

    if(text == "Legal help needed?"){
      return legalbtn.legalno;
  }else {
      return legalbtn.PropDealerno;
    }

  }

}