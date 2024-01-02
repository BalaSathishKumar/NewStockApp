import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/appbar_widgets/common_appbar.dart';
import '../../common_widgets/appbar_widgets/logotxtappbar.dart';
import '../../common_widgets/bottomsheet_widgets/IAgreeDsn.dart';
import '../../common_widgets/button_widgets/common_button.dart';
import '../../common_widgets/loading_widgets/loader.dart';
import '../../constants/colors.dart';
import '../../data/models/StatusandMessageModel.dart';
import '../../utils/common_functions.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/CommonProvider.dart';
import '../../viewModel/base_view_model/base_view_model.dart';
import '../../viewModel/portfolio_view_model.dart';

class SendEnquiry extends StatefulWidget {
  const SendEnquiry({super.key});

  @override
  State<SendEnquiry> createState() => _SendEnquiryState();
}

class _SendEnquiryState extends State<SendEnquiry> {
  late MyPortfolioViewModel _myPortfolioViewModel;
  late CommonProvider _commonProvider;
  TextEditingController _namecontrolller = TextEditingController();
  TextEditingController _emailcontrolller = TextEditingController();
  TextEditingController _contactcontrolller = TextEditingController();
  TextEditingController _subscribecontrolller = TextEditingController();
  TextEditingController _messagecontrolller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _myPortfolioViewModel= Provider.of<MyPortfolioViewModel>(context,listen: false);
    _commonProvider= Provider.of<CommonProvider>(context,listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _commonProvider.setIsChecked(false);
    });

  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child:   Consumer<CommonProvider>(
          builder: (context, commonvm, child) {
            return Scaffold(
              appBar: CustomAppBar(height: 60.0, title: 'Send Enquiry', appbarclr: Appcolors.white),
              backgroundColor: Appcolors.white,
              body: Container(
                height: deviceheight,
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
                     /* SizedBox(height: 60),
                      LogoTxtAppbar(logotag: "sendeq",
                          title: "Send Enquiry",
                          Isportfolio: false,
                          onPressed: () {}),*/
                      Container(
                        width: devicewidth,
                        // color: Colors.red.shade100,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, right: 18, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildNameandTxtfld("Name", _namecontrolller, TextInputType.name),
                              buildNameandTxtfld("Email", _emailcontrolller, TextInputType.emailAddress),
                              buildNameandTxtfld("Contact", _contactcontrolller, TextInputType.number),
                              AgreementCheckbox(
                                IsSendEq: true,
                                value: commonvm.IsChecked,
                                label: 'Subscribe',
                                onChanged: (bool? newValue) {
                                  _commonProvider.setIsChecked(newValue ?? false);
                                },
                              ),

                              // buildNameandTxtfld("Subscribe",_subscribecontrolller,TextInputType.name),
                              buildNameandTxtfld2("Message", _messagecontrolller, TextInputType.name),
                              Padding(
                                padding:
                                const EdgeInsets.only(
                                    top: 38.0, left: 18, right: 18),
                                child: Consumer<MyPortfolioViewModel>(
                                    builder: (context, addfoliovm, child) {
                                      return addfoliovm.state == ViewState.busy
                                          ? Loader()
                                          : Container(
                                        height: 50,
                                        width: devicewidth,
                                        child: CustomMaterialButton(


                                          /* {
                                        "name":"Boopathi",
                                        "email":"boopathit98@gmail.com",
                                        "contact":"8760083370",
                                        "message":"testing",
                                        "subscribe":true
                                      }*/

                                          text: 'Send',
                                          onPressed: () {
                                            //  context.router.push(Saudahomepage());
                                            if (_formKey.currentState!.validate()) {

                                              if(!chekContact(_contactcontrolller.text)){
                                                return showToast("Please enter valid number.");
                                              }else if(!checkEmailAddress(_emailcontrolller.text)){
                                                return showToast("Please enter valid email.");
                                              }else {
                                                Map<String, dynamic> contactusparam = {
                                                "name": _namecontrolller.text,
                                                "email": _emailcontrolller.text,
                                                "contact": _contactcontrolller.text,
                                                "message": _messagecontrolller.text,
                                                "subscribe":  commonvm.IsChecked,

                                              };
                                                commonvm.IsChecked?  _myPortfolioViewModel
                                                  .ContactUsapi(
                                                  onFailureRes: onFailureRes,
                                                  onSuccessRes: onSuccessRes,
                                                  contactusparam: contactusparam) : showToast("Please Subscribe");
                                              print('Button pressed! ${contactusparam}');
                                            }
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
      ),
    );
  }

  Container buildNameandTxtfld(String title, TextEditingController contoller, TextInputType keytype) {
    return Container(
      color: Appcolors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,style: CustomTextStyle.txt14Rltitlegrey3,),
            TextFormField(
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

  onFailureRes(String p1) {
  }

  onSuccessRes(StatusandMessageModel? p1) {
    showToast(p1?.message ?? "");
    Navigator.pop(context);
  }

 bool chekContact(String text) {
    print('_contactcontrolller.text length ${_contactcontrolller.text.length}');
    if(text.length == 10){
      return true;
    }else{
      return false;
    }
  }
}
