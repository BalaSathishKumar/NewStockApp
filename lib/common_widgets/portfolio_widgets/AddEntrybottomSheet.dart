import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';
import 'package:base_flutter_provider_project/utils/common_functions.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:base_flutter_provider_project/viewModel/base_view_model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../viewModel/portfolio_view_model.dart';
import '../button_widgets/common_button.dart';
import '../loading_widgets/loader.dart';
import '../textfields_widgets/common_textfield_withicon.dart';

class AddEntryBottomSheet extends StatefulWidget {
  const AddEntryBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddEntryBottomSheet> createState() => _AddEntryBottomSheetState();
}

class _AddEntryBottomSheetState extends State<AddEntryBottomSheet> {
  late MyPortfolioViewModel _myPortfolioViewModel;
  TextEditingController _assetvaluecontrolller = TextEditingController();
  TextEditingController _shareownedcontrolller = TextEditingController();
  TextEditingController _assetnamecontrolller = TextEditingController();
  TextEditingController _datofpurchsecontrolller = TextEditingController();
  TextEditingController _purchasedfomcontrolller = TextEditingController();
  TextEditingController _notescontrolller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    _myPortfolioViewModel= Provider.of<MyPortfolioViewModel>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Container(

height: deviceheight/2 +250,
        decoration: BoxDecoration(
         //  color: Colors.green.shade100,
           // color: Appcolors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28.0),
              topRight: Radius.circular(28.0),
            )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                width: devicewidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26.0),
                      topRight: Radius.circular(26.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 0),
                  child: Column(
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
                width: devicewidth,
               // color: Colors.red.shade100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0,right: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      buildNameandTxtfld("Asset Name",_assetnamecontrolller,TextInputType.name,true),
                      buildNameandTxtfld("No of shares owned",_shareownedcontrolller,TextInputType.number,true),
                      buildNameandTxtfld("Asset Value",_assetvaluecontrolller,TextInputType.number,true),
                      GestureDetector(
                          onTap: (){
                            _selectDate(context);
                          },
                          child: buildNameandTxtfld("Date of Purchase",_datofpurchsecontrolller,TextInputType.number,false)),
                      buildNameandTxtfld("Purchased From",_purchasedfomcontrolller,TextInputType.name,true),
                      buildNameandTxtfld2("Additional Notes",_notescontrolller,TextInputType.name),
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 38.0, left: 18, right: 18),
                        child: Consumer<MyPortfolioViewModel>(
                          builder: (context,addfoliovm,child) {
                            return addfoliovm.state == ViewState.busy? Loader():Container(
                              height: 50,
                              width: devicewidth,
                              child: CustomMaterialButton(
                                text: 'Save',
                                onPressed: () {
                                  //  context.router.push(Saudahomepage());
                                  if (_formKey.currentState!.validate()) {
                                    Map<String, dynamic> addfolioparam = {
                                      "name": _assetnamecontrolller.text,
                                      "no_of_shares": _shareownedcontrolller
                                          .text,
                                      "asset_value": _assetvaluecontrolller
                                          .text,
                                      "purchase_date": _datofpurchsecontrolller
                                          .text,
                                      "purchase_from": _purchasedfomcontrolller
                                          .text,
                                      "notes": _notescontrolller.text,
                                    };

                                    _myPortfolioViewModel.AddPortfolioapi(
                                        onFailureRes: onFailureRes,
                                        onSuccessRes: onSuccessRes,
                                        addfolioparam: addfolioparam);
                                    print('Button pressed! ${addfolioparam}');
                                  }
                                },
                              ),
                            );
                          }
                        ),
                      ),
                      SizedBox(
                        height: 150,
                      ),



                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildNameandTxtfld(String title, TextEditingController contoller, TextInputType keytype,bool? enable ) {
    return Container(
      color: Appcolors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title,style: CustomTextStyle.txt14Rltitlegrey3,),
                            TextFormField(
                              enabled: enable ?? true,
                              controller: contoller,
                              keyboardType: keytype,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Appcolors.splashbgcolor, width: 1.0),
                                ),
                              ),
                            validator: (value){
                                if(value == null || value.isEmpty){
                                  return "Please enter this field";
                                }else{
                                  return null;
                                }
                            },
                            )
                          ],
                        ),
                      ),
                    );
  }



  onFailureRes(String p1) {
  }

  onSuccessRes(StatusandMessageModel? p1) {
    showToast("Third party trade added successfully.");
    Navigator.pop(context);
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1950),
        lastDate: DateTime(2101),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Appcolors.splashbgcolor,
                onPrimary: Colors.white,
                surface: Appcolors.splashbgcolor,
                onSurface: Appcolors.black,
              ),
              dialogBackgroundColor: Appcolors.white,
            ),
            child: child!,
          );
        }
    );


    if (picked != null)
      setState(() {
        selectedDate = picked;
        _datofpurchsecontrolller.text = DateFormat.yMd().format(selectedDate);
      //  _userAgeProvider.setUserDOBselect(true);
      });
  }
}
Container buildNameandTxtfld2(String title, TextEditingController notescontrolller, TextInputType name) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: CustomTextStyle.txt14Rltitlegrey3,),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: name,
            validator: (value){
              if(value == null || value.isEmpty){
                return "Please enter notes";
              }else{
                return null;
              }
            },
            controller: notescontrolller,
            maxLines: 5, // Allow the TextField to have multiple lines
            decoration: InputDecoration(
              hintStyle: TextStyle(fontFamily: "Roboto-LightItalic",fontSize: 16),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Appcolors.splashbgcolor, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),

          ),
        ],
      ),
    ),
  );
}