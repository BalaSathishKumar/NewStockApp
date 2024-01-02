import 'package:base_flutter_provider_project/data/models/LoginModel/OnBoardScreenModel.dart';
import 'package:base_flutter_provider_project/ui/Register/RegisterPage.dart';
import 'package:base_flutter_provider_project/ui/welcome/welcome.dart';
import 'package:base_flutter_provider_project/viewModel/onboard_viewmodel.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/local_images.dart';
import '../../utils/common_textstyles.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late OnboardViewModel _onboardViewModel;
  List<OnBoardSwipe> texts3 = [];
  final List<OnBoardSwipe> swipeData = [];

  @override
  void initState() {
    super.initState();
    _onboardViewModel = Provider.of<OnboardViewModel>(context, listen: false);
  }

/*  final List<OnBoardSwipe> texts3 = [
    OnBoardSwipe(
        text1: 'Trade stocks, smarter.',
        text2: 'Having 60+ years of experience, trust us to help you trade safely online. Please provide a USP of your business here in not more than 3 lines.'),
    OnBoardSwipe(
        text1: 'Trade stocks, smarter.',
        text2: 'Having 60+ years of experience, trust us to help you trade safely online. Please provide a USP of your business here in not more than 3 lines.'),
    OnBoardSwipe(
        text1: 'Trade stocks, smarter.',
        text2: 'Having 60+ years of experience, trust us to help you trade safely online. Please provide a USP of your business here in not more than 3 lines.')
  ];*/

  PageController _pageController = PageController();
  int _currentPageIndex = 0;
  int _onNext = 0;

  void _onPageChanged(dynamic index) {
    //_onboardViewModel.OnboardResponseModel?.slider?.length
    print('on page change index ${index}');
    if (index == 0) {
      _onNext = 0;
      _onboardViewModel.setCurrentIndex(0);
    } else {
      if (index >= _onboardViewModel.OnboardResponseModel?.slider?.length) {

      } else {
        _onNext = index;
        _onboardViewModel.setCurrentIndex(index);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.white,
      body: Stack(
        children: [
          Hero(
            tag: 'onbordbg',
            child: Image.asset(
              LocalPNGImages.onboardbg,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            child: Consumer<OnboardViewModel>(
                builder: (context, slidedata, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 7,
                      child: Container(
                       // color: Colors.red,
                        // height: 200,
                        width: double.infinity,
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: _onPageChanged,
                          children: loadSlide(slidedata.OnboardResponseModel?.slider ),
                        ),
                      )),
                  Expanded(
                    flex: 1,
                    child: _buildDotIndicator(
                        slidedata.OnboardResponseModel?.slider ?? [],
                        slidedata.currentindex),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(

                      width: double.infinity,
                     // color:Colors.red,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              // context.router.push(const WelcomePage());
                              Route route = MaterialPageRoute(
                                  builder: (context) => WelcomePage());
                              Navigator.pushReplacement(context, route);

                              //   Navigator.push(context, MaterialPageRoute(builder: (context)=> WelcomePage()));
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> KYCpage()));
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Skip",
                                    style: CustomTextStyle.txt14RrlitegreenUL,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(),
                          InkWell(
                            onTap: () {
                              //print('_onnext clicked ${_onNext} and ${ slidedata.OnboardResponseModel!.slider!.length}');
                              if (_pageController.hasClients) {
                                if (slidedata.OnboardResponseModel?.slider != null && _onNext >= slidedata.OnboardResponseModel!.slider!.length) {
                                  /*_onNext = 0;
                                  _onboardViewModel.setCurrentIndex(0);*/

                                } else {
                                  _pageController.animateToPage(
                                    _onNext++ + 1,
                                    duration:
                                    const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                  print('next reached ${_onNext} and ${ slidedata.OnboardResponseModel!.slider?.length}');
                                  if(_onNext == slidedata.OnboardResponseModel!.slider?.length){
                                   //  context.router.push(const WelcomePage());
                                    Route route = MaterialPageRoute(builder: (context) => WelcomePage());
                                    Navigator.pushReplacement(context, route);
                                  }
                                }
                              }
                            },
                            child: ClipOval(
                                child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: Appcolors.black),
                              ),
                              child: Hero(
                                tag: 'next',
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                      LocalSVGImages.rightarrow,
                                      height: 10,
                                      width: 10),
                                ),
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildDotIndicator(List<NewSlider> list, int currentindex) {
    print('build ind curnt indx ${currentindex}');
    return Container(
    //  color: Colors.orange,
      child: Column(
        children: [
          DotsIndicator(
            dotsCount: list == null || list.isEmpty ? 1 : list.length,
            position: setdotIndpos(currentindex, list) ,
            //currentindex >= list.length?0.0:currentindex.toDouble(),
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(20.0, 9.0),
              activeColor: Appcolors.black,
              color: Appcolors.black,
              activeShape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        ],
      ),
    );
  }

  onFailureRes(String p1) {}

  onSuccessRes(List<NewSlider>? slidedata) {}

  loadSlide(List<NewSlider>? slidedata) {
    print('slidata in loadSlide ${slidedata?.length}');
    if (slidedata != null && slidedata.isNotEmpty) {
      swipeData.clear();
      for (var item in slidedata) {
        swipeData.add(
          OnBoardSwipe(
            text1: item.title.toString() ?? "",
            text2: item.description ?? "",
            imageurl: item.imageUrl ?? "",
          ),
        );
      }
      //   print('swipe data length ${swipeData.length}');
      return swipeData;
    } else {
      print('Failed to load data.');
      return [Container()];
    }
  }

  setdotIndpos(int currentindex, List<NewSlider> list) {
    print('setdotindpos ${currentindex} ${list}');
    if(list == null || list.isEmpty) {
      return 0.0;
    }else {
      if (currentindex >= list.length) {
        return _onboardViewModel.setCurrentIndex(0);
      } else {
        return currentindex.toDouble();
      }
    }
  }
}

class OnBoardSwipe extends StatelessWidget {
  OnBoardSwipe({
    required this.text1,
    required this.text2,
    required this.imageurl,
  });

  String text1;
  String text2;
  String imageurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: SvgPicture.network(
              imageurl,
              placeholderBuilder: (BuildContext context) => Container(),
            ),
          ),
          Hero(
            tag: 'brandLogo22',
            child: SvgPicture.asset(LocalSVGImages.ic_brand_logo,
                height: 30, width: 30),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: CustomTextStyle.txt16Rr,
                  children: <TextSpan>[
                    TextSpan(text: text1, style: CustomTextStyle.txt16gp),
                    TextSpan(text: "\n $text2"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
