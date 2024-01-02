import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../ui/welcome/welcome.dart';
import '../../utils/common_textstyles.dart';
import '../../viewModel/CommonProvider.dart';
import '../button_widgets/common_button.dart';
import '../textfields_widgets/common_textfield.dart';


class CommonDialog extends StatefulWidget {
  final TextEditingController? controller;
  final String? initialText;
  final Function(String)? onSubmitted;

  CommonDialog({
    this.controller,
    this.initialText,
    this.onSubmitted,
  });

  @override
  _CommonDialogState createState() => _CommonDialogState();
}
class _CommonDialogState extends State<CommonDialog> {
  late TextEditingController _textEditingController;
  String? _initialText;

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.controller ?? TextEditingController();
    _initialText = widget.initialText ?? '';
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Appcolors.white,
      body: Container(
        width: devicewidth,
        height: deviceheight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: deviceheight / 2.5,
                child: Stack(
                  children: [
                    Hero(
                      tag: 'headrgtwave',
                      child: Image.asset(
                        LocalPNGImages.headrightwave,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      child: Container(
                        height: deviceheight / 2,
                        width: devicewidth,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 66.0, left: 18, right: 18),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                tag: 'brandLogo1',
                                child: SvgPicture.asset(
                                    LocalSVGImages.ic_brand_logo,
                                    height: 30,
                                    width: 30),

                              ),
                              Text(
                                "Welcome",
                                style: CustomTextStyle.txt36gp,
                              ),
                              Text(
                                "Enter mobile number",
                                style: CustomTextStyle.txt24Rblitegreen,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
           /*   TextField(
                keyboardType: TextInputType.number,
                controller: _textEditingController,
                decoration: InputDecoration(hintText: 'Enter your number'),
              ),*/

              Container(
               height: 80,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Consumer<CommonProvider>(
                              builder: (context, commonvm, child) {
                                return Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 18.0),
                                      child: Hero(
                                          tag: 'mobile',
                                          child: SvgPicture.asset(
                                            commonvm.IsMobile
                                                ? LocalSVGImages.mobilegreen
                                                : LocalSVGImages.mobileblack,
                                          )

                                        /* Image.asset(
                                          LocalPNGImages.mobile,
                                          height: 24,
                                          width: 30,
                                          fit: BoxFit.fill,
                                        ),*/
                                      ),

                                    ),
                                    TextButton(
                                      onPressed: () {
                                        showCountryPicker(
                                          context: context,
                                          showPhoneCode: true,
                                          // optional. Shows phone code before the country name.
                                          onSelect: (Country country) {
                                            print(
                                                'Select country: ${country
                                                    .phoneCode}');
                                            Provider.of<Counterr>(context,
                                                listen: false)
                                                .increment(
                                                country.phoneCode);
                                          },
                                        );
                                      },
                                      child: Consumer<Counterr>(
                                        builder: (context, counter, child) {
                                          return Text(
                                            '(+${counter.phonecode})',
                                            style: CustomTextStyle
                                                .txt18Rrblk,
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: devicewidth / 2 + 50,
                                      height: 45,
                                      //   color: Colors.red,
                                      child: CustomTextField(
                                        hintText: 'phone number',
                                        controller: _textEditingController,
                                        onChanged: (value) {

                                        },
                                      ),
                                    ),
                                  ],
                                );
                              }
                          ),
                        ),
                      ],
                    )),
              ),

              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
            //     color: Colors.red,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0,right: 18,bottom: 5),
                    child: CustomMaterialButton(
                      text: 'Submit',
                      onPressed: () {
                     /*   Navigator.of(context).pop(_textEditingController.text);*/
                        if (widget.onSubmitted != null) {
                          widget.onSubmitted!(_textEditingController.text);
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );




      /*AlertDialog(
      title: Text('Enter Your Mobile Number'),
      content: TextField(
        keyboardType: TextInputType.number,
        controller: _textEditingController,

        decoration: InputDecoration(hintText: 'Enter your number'),

      ),
      actions: [

        Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
         // color: Colors.red,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18,bottom: 5),
              child: CustomMaterialButton(
                text: 'Submit',
                onPressed: () {
                  Navigator.of(context).pop(_textEditingController.text);
                  if (widget.onSubmitted != null) {
                    widget.onSubmitted!(_textEditingController.text);
                  }
                },
              ),
            ),
          ),
        )

      ],
    );*/
  }
}


