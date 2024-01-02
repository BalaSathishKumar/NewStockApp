import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:base_flutter_provider_project/data/models/StatusandMessageModel.dart';
import 'package:base_flutter_provider_project/data/models/User_Directory_model/ChatUsersList.dart';
import 'package:base_flutter_provider_project/data/models/dashboard_model/DashboardResponseModel.dart';
import 'package:base_flutter_provider_project/ui/ChatPage/ChatRoomPage.dart';
import 'package:base_flutter_provider_project/utils/common_textstyles.dart';
import 'package:base_flutter_provider_project/viewModel/CommonProvider.dart';
import 'package:base_flutter_provider_project/viewModel/explore_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/Stock_widgets/StockSections.dart';
import '../../common_widgets/appbar_widgets/green_appbar.dart';
import '../../common_widgets/button_widgets/LGgRoundedBtn.dart';
import '../../common_widgets/button_widgets/common_button.dart';
import '../../common_widgets/dropdown_widgets/CategoryDropDown.dart';
import '../../common_widgets/dropdown_widgets/ConsultCategoryDropDown.dart';
import '../../common_widgets/dropdown_widgets/ConsultStockDropDown.dart';
import '../../common_widgets/dropdown_widgets/common_dropdown.dart';
import '../../common_widgets/loading_widgets/loader.dart';
import '../../common_widgets/portfolio_widgets/AddEntrybottomSheet.dart';
import '../../common_widgets/search_widgets/common_search.dart';
import '../../constants/local_images.dart';
import '../../data/models/Explore_model/ExploreModel.dart';
import '../../data/models/dashboard_model/DashBoardFilterModel.dart';
import '../../utils/common_functions.dart';
import '../../viewModel/ChatUsers_view_model.dart';
import '../../viewModel/Consultation_view_model.dart';
import '../../viewModel/base_view_model/base_view_model.dart';
import '../../viewModel/dashboard_view_model.dart';
import '../home/StockHome.dart';
import '../home/homepage.dart';

class AdvisorandBroker extends StatefulWidget {
  final bool IsClickForAdvisorHelp;
  Stocks? selectedstocks;

  AdvisorandBroker(
      {Key? key, required this.IsClickForAdvisorHelp, this.selectedstocks})
      : super(key: key);

  @override
  State<AdvisorandBroker> createState() => _AdvisorandBrokerState();
}

class _AdvisorandBrokerState extends State<AdvisorandBroker> {
  final List<ListItem> items = [
    ListItem(
        lotsize: "1",
        stattxt: "Pending",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Pharma",
        text: 'Lizzie Saavedra',
        statyears: "5+ years",
        rate: '132',
        shname: 'Broker',
        colors: 0xFF00FF7F,
        imageUrl: LocalPNGImages.exp1),
    ListItem(
        lotsize: "1",
        stattxt: "Credited",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "AI/ML",
        statyears: "5+ years",
        text: 'Leanne Simpson',
        rate: '1681',
        shname: 'Dealer',
        colors: 0xFFFF1493,
        imageUrl: LocalPNGImages.exp2),
    ListItem(
        lotsize: "1",
        stattxt: "Credited",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Aviation",
        statyears: "5+ years",
        text: 'Yolanda Barrueco',
        rate: '541',
        shname: 'Broker',
        colors: 0xFF00FFFF,
        imageUrl: LocalPNGImages.exp1),
    ListItem(
        lotsize: "1",
        stattxt: "Pending",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Construction",
        statyears: "5+ years",
        text: 'Lacara Jones',
        rate: '321',
        shname: 'Dealer',
        colors: 0xFFFFA500,
        imageUrl: LocalPNGImages.exp2),
    ListItem(
        lotsize: "1",
        stattxt: "Credited",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Construction",
        statyears: "5+ years",
        text: 'FXVZAWLS906',
        rate: '150',
        shname: 'ABS',
        colors: 0xFF9900CC,
        imageUrl: LocalPNGImages.exp1),
    ListItem(
        lotsize: "1",
        stattxt: "Pending",
        statres: "E-Mobility",
        statres2: "100k",
        toprated: "Construction",
        statyears: "5+ years",
        text: 'FXVZAWLS906',
        rate: '150',
        shname: 'ABS',
        colors: 0xFF9900CC,
        imageUrl: LocalPNGImages.exp1),
  ];
  final FocusNode _focusNode = FocusNode();
  List<Users> AllMembers = [];
  List<Users>? AllMembers2 = [];
  late ChatUsersViewModel _chatusersViewModel;
  late CommonProvider _commonProvider;
  String _selectedOption = 'All';

  bool get IsAdvisorHelp => widget.IsClickForAdvisorHelp;

  Stocks? get selectedStockDtl => widget.selectedstocks;

  @override
  void initState() {
    super.initState();
    print(
        'selected stock cat in ad and bro ${selectedStockDtl?.category?.categoryName} ');
    _chatusersViewModel = Provider.of<ChatUsersViewModel>(context, listen: false);
    _commonProvider = Provider.of<CommonProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _commonProvider.setUserDirSearch(false);
      _commonProvider.setFilterRoll("All");
      _chatusersViewModel.getchatusersapi(
          onFailureRes: onFailureRes, onSuccessRes: onSuccessRes);
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Consumer<CommonProvider>(builder: (context, UserDirSearch, child) {
      return Scaffold(
          appBar: GreenAppBar(
              icn1: LocalSVGImages.filter,
              icn1tag: "searchA&B",
              icn2: LocalSVGImages.search,
              icn2tag: "send",
              isDealerChat: false,
              onPressBack: () {
                Navigator.pop(context);
              },
              onPressStar: () {
                FocusScope.of(context).unfocus();
                // _focusNode.dispose();
                // _showPopup(context, devicewidth);
                _showRollPopup(context);
              },
              onPressSend: () {
                if (UserDirSearch.IsUserDirSearch) {
                  UserDirSearch.setUserDirSearch(false);
                } else {
                  UserDirSearch.setUserDirSearch(true);
                }
              },
              height: 80.0,
              title: 'User Directory',
              hidemore: true,
              appbarclr: Appcolors.splashbgcolor2,
              IsAdvisorHelp: IsAdvisorHelp),
          backgroundColor: Appcolors.white,
          body: Container(
            width: devicewidth,
            child: Consumer<ChatUsersViewModel>(
                builder: (context, chatlistvm, child) {
              //     print('chk chat list');

              addAllmembers(
                  chatlistvm.getchatusersResponseModel?.data?.users,
                  chatlistvm.getchatusersResponseModel?.data?.dealers,
                  chatlistvm.getchatusersResponseModel?.data?.advisors,
                  UserDirSearch.IsFilterRoll);
              //     chatlistvm.AllMembersNew = AllMembers;

              //   print('allMembers2 in build length::: ${ chatlistvm.AllMem.length}');
              return chatlistvm.state == ViewState.busy
                  ? Loader()
                  : Column(
                      children: [
                        SizedBox(height: 18),
                        UserDirSearch.IsUserDirSearch
                            ? CommonSearch(
                                hinttxt: 'Search by name',
                                onFocusNode: _focusNode,
                                onSearchTextChanged: (text) {
                                  searchItem(text, AllMembers, chatlistvm);
                                },
                              )
                            : SizedBox.shrink(),
                        Expanded(
                            child: StartChatWith(
                                deviceheight: deviceheight,
                                devicewidth: devicewidth,
                                items: items,
                                IsAdvisorHelp: IsAdvisorHelp,
                                allmembers: chatlistvm.AllMem ?? [],
                                // allmembers:AllMembers ?? [],
                                selectedstocks: selectedStockDtl))
                      ],
                    );
            }),
          ));
    });
  }

  onFailureRes(String p1) {}

  onSuccessRes(ChatUsersList? p1) {
    _chatusersViewModel.setAllMenber(AllMembers);
  }

  _showPopup(BuildContext context, double devicewidth) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Consumer<CommonProvider>(
              builder: (context, filterroll, child) {
            return AlertDialog(
              title: Text('Select Roll'),
              content: Container(
                child: CustomDropdown(
                  dropdwnicon: LocalSVGImages.dropdwn,
                  underlinecolor: Appcolors.kyctxtgrey,
                  iconcolor: Appcolors.kyctxtgrey,
                  // textdecoration: CustomTextStyle.txt16kyctxtgrey,
                  textdecoration: CustomTextStyle.txt16Rb,
                  devicewidth: devicewidth / 2 + 10,
                  selectedValue: filterroll.IsFilterRoll,
                  options: ['All', 'Users', 'Brokers', 'Advisors'],
                  onChanged: (value) {
                    if (value != null) {
                      filterroll.setFilterRoll(value);
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel', style: TextStyle(color: Appcolors.red)),
                ),
              ],
            );
          });
        });
  }

  _showRollPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer<CommonProvider>(builder: (context, filterroll, child) {
          return AlertDialog(
            title: Text('Select Roll'),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RadioListTile(
                      title: Text('All'),
                      value: 'All',
                      activeColor: Appcolors.splashbgcolor2,
                      groupValue: filterroll.IsFilterRoll,
                      onChanged: (value) {
                        /*   setState(() {
                          selectedOption = value.toString();
                        });*/
                        filterroll.setFilterRoll(value.toString());
                        Navigator.of(context).pop();
                      },
                    ),
                    RadioListTile(
                      title: Text('Users'),
                      value: 'Users',
                      activeColor: Appcolors.splashbgcolor2,
                      groupValue: filterroll.IsFilterRoll,
                      onChanged: (value) {
                        filterroll.setFilterRoll(value.toString());
                        Navigator.of(context).pop();
                      },
                    ),
                    RadioListTile(
                      title: Text('Advisors'),
                      value: 'Advisors',
                      activeColor: Appcolors.splashbgcolor2,
                      groupValue: filterroll.IsFilterRoll,
                      onChanged: (value) {
                        filterroll.setFilterRoll(value.toString());
                        Navigator.of(context).pop();
                      },
                    ),
                    RadioListTile(
                      title: Text('Brokers'),
                      value: 'Brokers',
                      activeColor: Appcolors.splashbgcolor2,
                      groupValue: filterroll.IsFilterRoll,
                      onChanged: (value) {
                        filterroll.setFilterRoll(value.toString());
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            ),
            actions: [
              /*       TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    },
                  child: Text('cancel',style: TextStyle(color: Appcolors.black),),
                ),*/
            ],
          );
        });
      },
    );
  }

  void searchItem(
      String text, List<Users> allMembers, ChatUsersViewModel chatlistvm) {
    print('allMembers in search length::: ${allMembers.length}');
    AllMembers2?.clear();
    chatlistvm.AllMem.clear();
    // chatlistvm.AllMembersNew.clear();
    //  setState(() {
    //  filteredItems2 = searchitems.where((element) => element.text.toLowerCase().contains(query.toLowerCase())).toList();
    if (allMembers != null) {
      chatlistvm.setAllMenber(allMembers
          .where((element) =>
              element.name!.toLowerCase().contains(text.toLowerCase()))
          .toList());
      print('allMembers2 length::: ${chatlistvm.AllMem.length}');
    }
    if (text == "") {
      chatlistvm.setAllMenber(allMembers);
    }

    //  });
  }

  void addAllmembers(List<Users>? users, List<Users>? dealers,
      List<Users>? advisors, String isFilterRoll) {
    if (users != null && dealers != null && advisors != null) {
      AllMembers.clear();

      if (IsAdvisorHelp) {
        if (advisors.isNotEmpty) {
          for (Users advisordata in advisors) {
            AllMembers.add(advisordata);
          }
        }
      } else {
        if (isFilterRoll == "Users") {
          if (users.isNotEmpty) {
            for (Users userdata in users) {
              AllMembers.add(userdata);
            }
          }
        } else if (isFilterRoll == "Brokers") {
          if (dealers.isNotEmpty) {
            for (Users dealerdata in dealers) {
              AllMembers.add(dealerdata);
            }
          }
        } else if (isFilterRoll == "Advisors") {
          if (advisors.isNotEmpty) {
            for (Users advisordata in advisors) {
              AllMembers.add(advisordata);
            }
          }
        } else {
          if (users.isNotEmpty) {
            for (Users userdata in users) {
              AllMembers.add(userdata);
            }
          }
          if (dealers.isNotEmpty) {
            for (Users dealerdata in dealers) {
              AllMembers.add(dealerdata);
            }
          }
          if (advisors.isNotEmpty) {
            for (Users advisordata in advisors) {
              AllMembers.add(advisordata);
            }
          }
        }
      }
    }
  }
}

class StartChatWith extends StatefulWidget {
  StartChatWith(
      {super.key,
      required this.deviceheight,
      required this.devicewidth,
      required this.items,
      required this.IsAdvisorHelp,
      required this.allmembers,
      this.selectedstocks});

  final double deviceheight;
  final double devicewidth;
  final bool IsAdvisorHelp;
  final List<ListItem> items;
  final List<Users> allmembers;
  Stocks? selectedstocks;

  @override
  State<StartChatWith> createState() => _StartChatWithState();
}

class _StartChatWithState extends State<StartChatWith> {
  //final List<Users> AllMembers = [];
  TextEditingController _notescontrolller = TextEditingController();
  late ConsultationViewModel _consultationViewModel;
  late DashboardViewModel _dashboardViewModel;
  late DropOptions _dropOptions;

  bool get IsAdhlp => widget.IsAdvisorHelp;

  Stocks? get SelectedStockDetails => widget.selectedstocks;

  List<Users>? get AllMembers => widget.allmembers;
  List<Stocks?> stocklist = [];
  final List<String> professionAndpremium = [];

  @override
  void initState() {
    super.initState();
    print(
        'selected stock cat in startchatwuth ${SelectedStockDetails?.category?.categoryName} and ${SelectedStockDetails?.category?.id}');
    _dashboardViewModel = Provider.of<DashboardViewModel>(context, listen: false);
    _consultationViewModel = Provider.of<ConsultationViewModel>(context, listen: false);
    _dropOptions = Provider.of<DropOptions>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //  _dashboardViewModel.dashboardapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes);
      print('_dropOptions ${_dropOptions.dropoptions?.categoryName}');
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Consumer<CommonProvider>(builder: (context, filterroll, child) {
      return Container(
        child:
            Consumer<ChatUsersViewModel>(builder: (context, userdata, child) {
          return Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Container(
                height: widget.deviceheight,
                width: widget.devicewidth,
                child: AllMembers != null && AllMembers!.isEmpty
                    ? Center(child: Text("No Data Found"))
                    : ListView.builder(
                        // itemCount: items.length,
                        //  itemCount: userdata.getchatusersResponseModel?.data?.users?.length ??0,
                        itemCount: AllMembers?.length ?? 0,
                        itemBuilder: (context, index) {
                          //var chatuserdata = userdata.getchatusersResponseModel?.data?.users ?? [];
                          var chatuserdata = AllMembers ?? [];
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8, bottom: 8),
                            child: GestureDetector(
                              onTap: () {
                                showCustomBottomSheet(
                                    context,
                                    chatuserdata[index],
                                    SelectedStockDetails,
                                    devicewidth);
                              },
                              child: Container(
                                  height: 120,

                                  decoration: BoxDecoration(
                                    //color: Colors.red.shade50,
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Appcolors.splashbgcolor,
                                        // Border color
                                        width: 1.0,
                                        // Border width
                                        style:
                                            BorderStyle.solid, // Border style
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                            //      color: Colors.yellow,
                                            child: CircleAvatar(
                                          radius: 30,
                                          backgroundImage: chatuserdata[index].photoUrl != null
                                              ? CachedNetworkImageProvider(chatuserdata[index].photoUrl ?? "", errorListener: () {
                                                  print('image error');
                                                  //   AssetImage(LocalPNGImages.connection_error) ;
                                                })
                                              : PlaceholderImage(),

                                          //:AssetImage(items[index].imageUrl)
                                        )),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                    flex: 3,
                                                    child: Container(
                                                        //width: widget.devicewidth,
                                                        // color: Colors.green.shade50,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            // Text(items[index].text,style: CustomTextStyle.txt16Rmtxtblk,),
                                                            Text(
                                                              chatuserdata[index].name ?? "",
                                                              style: CustomTextStyle.txt16Rmtxtblk,
                                                            ),
                                                          ],
                                                        ))),
                                                Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                       // width: widget.devicewidth,
                                                        //         color: Colors.blue.shade50,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            //Text(items[index].shname,style: CustomTextStyle.txt14Rlblk,),
                                                            Text(
                                                              chatuserdata[
                                                                          index]
                                                                      .roleName ??
                                                                  "",
                                                              style:
                                                                  CustomTextStyle
                                                                      .txt14Rlblk,
                                                            ),
                                                          ],
                                                        ))),
                                                Expanded(
                                                    flex: 3,
                                                    child: Container(
                                                        //width: widget.devicewidth,
                                                        //  color: Colors.orange.shade50,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              chatuserdata[index].professionName ?? "", style: CustomTextStyle.txt12Rmtxtlisttilegrey12,
                                                            ),
                                                          ],
                                                        ))),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap: () {
                                                    showCustomBottomSheet(
                                                        context,
                                                        chatuserdata[index],
                                                        SelectedStockDetails,
                                                        devicewidth);
                                                  },
                                                  child: Container(
                                                   // height: 120,
                                                   //  color: Colors.red.shade100,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(Icons.more_horiz),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child:
                                                    chkStatus(chatuserdata[index].chatEnable)
                                                        ? GestureDetector(
                                                            onTap: () {
                                                              Navigator.push(context,
                                                                  MaterialPageRoute(builder: (context) => ChatRoomPage(chatuserID: chatuserdata[index].id ?? 0, IsAdminChat: false, username: chatuserdata[index].name)));
                                                            },
                                                            child: Container(
                                                           //   height: 120,
                                                                   //     color: Colors.yellow,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    height: 35,
                                                                    width: 50,
                                                                    decoration: BoxDecoration(
                                                                        //     color: Colors.green,
                                                                        border: Border.all(color: Appcolors.black, width: 0.5),
                                                                        borderRadius: BorderRadius.circular(12)),
                                                                    child: Center(
                                                                        child: Text(
                                                                      "Chat",
                                                                      style: CustomTextStyle
                                                                          .txt12Rmtxtlisttilegrey12,
                                                                    )),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        : SizedBox.shrink(),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          );
                        }),
              ));
        }),
      );
    });
  }

  showCustomBottomSheet(BuildContext context, Users chatuserdata,
      Stocks? selectedStockDetails, double devicewidth) {
    print('premiumType:: ${chatuserdata.premiumType}');
    print('ratings:: ${chatuserdata.ratings}');
    print('chatEnable:: ${chatuserdata.chatEnable.toString()}');
    professionAndpremium.clear();
    professionAndpremium.add(chatuserdata.premiumType ?? "");
    professionAndpremium.add(chatuserdata.professionName ?? "");
    print('professionAndpremium length:: ${professionAndpremium.length}');
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(23.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: widget.deviceheight / 2 + 260,
          decoration: BoxDecoration(
              color: Appcolors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(23.0),
                topRight: Radius.circular(23.0),
              )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: widget.devicewidth,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(23.0),
                        topRight: Radius.circular(23.0),
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
                              Icons.close,
                              color: Appcolors.black,
                              size: 25,
                            ))
                      ],
                    ),
                  ),
                ),
                Container(
                    color: Appcolors.white,
                    child: Column(
                      children: [
                        Container(
                            //      color: Colors.yellow,
                            child: CircleAvatar(
                          radius: 60,
                          backgroundImage: chatuserdata.photoUrl != null
                              ? CachedNetworkImageProvider(
                                  chatuserdata.photoUrl ?? "",
                                  errorListener: () {
                                  print('error');
                                })
                              : PlaceholderImage(),
                          /* AssetImage(item.imageUrl)*/
                        )),
                        SizedBox(height: 8),
                        Text(chatuserdata.name ?? "",
                            style: CustomTextStyle.txt16Rmtxtblk),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(chatuserdata.roleName ?? "",
                                style: CustomTextStyle.txt16Rl),
                            SizedBox(width: 8),
                            Text(chatuserdata.ratings ?? "",
                                style: CustomTextStyle.txt16Rmtxtblk),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 16,
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 18.0, right: 18.0),
                          child: Container(
                            // color: Colors.red.shade100,
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: professionAndpremium.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      // padding: EdgeInsets.all(25),
                                      decoration: BoxDecoration(
                                          // color: Color(widget.items[index].colors).withOpacity(0.1),
                                          color: Colors.green.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(60)),
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              professionAndpremium[index],
                                              style: TextStyle(
                                                  color: Color(widget
                                                          .items[index].colors)
                                                      .withOpacity(0.4)),
                                              // style: CustomTextStyle.txt14Rrtxttitlegrey4,
                                              maxLines: 1,
                                              softWrap: false,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: devicewidth,
                          // height: 100,
                          //  color: Colors.red,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "About me",
                                  style: CustomTextStyle.txt14gpquickstatsgrey,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  chatuserdata.about ?? "",
                                  style: CustomTextStyle.txt14Rrtxtblk,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              buildpopupcontainers(
                                  widget.devicewidth,
                                  "Deals done  ",
                                  getMetaData(chatuserdata.userMetaData, 1) ??
                                      "NA"),
                              buildpopupcontainers(
                                  widget.devicewidth,
                                  "Industry Experience  ",
                                  getMetaData(chatuserdata.userMetaData, 2) ??
                                      "NA"),
                              buildpopupcontainers(
                                  widget.devicewidth,
                                  "Expertise  ",
                                  getMetaData(chatuserdata.userMetaData, 3) ??
                                      "NA"),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        chatuserdata.roleName == "Advisors"
                            ? Container(
                                height: 50,
                                width: widget.devicewidth,
                                // color: Colors.red.shade50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () {
                                          ShowConsultationBox(
                                              chatuserdata.id,
                                              selectedStockDetails,
                                              widget.deviceheight,
                                              widget.devicewidth);
                                        },
                                        child: Container(
                                          height: 50,
                                          width: widget.devicewidth / 2 + 20,
                                          //  color: Colors.red,
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, right: 5),
                                              child: ArrowBtn(
                                                height: 50,
                                                width: widget.devicewidth,
                                                bgclr: Appcolors.newgrd1,
                                                btntxt: "Consultation",
                                                icnclr: Appcolors.black,
                                                iconData: Icons.arrow_forward,
                                              )),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: chkStatus(
                                                chatuserdata.chatEnable)
                                            ? GestureDetector(
                                                onTap: () {
                                                  chkStatus(chatuserdata
                                                          .chatEnable)
                                                      ? Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ChatRoomPage(
                                                                    chatuserID:
                                                                        chatuserdata.id ??
                                                                            0,
                                                                    IsAdminChat:
                                                                        false,
                                                                  )))
                                                      : showToast(
                                                          "Please Wait for admin approval");
                                                },
                                                child: Container(
                                                  height: 50,
                                                  width:
                                                      widget.devicewidth / 2 +
                                                          20,
                                                  //  color: Colors.red,
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 0,
                                                              right: 5),
                                                      child: ArrowBtn(
                                                        height: 50,
                                                        width:
                                                            widget.devicewidth,
                                                        bgclr:
                                                            Appcolors.btnbggrey,
                                                        btntxt: "Chat with me",
                                                        icnclr: Appcolors.black,
                                                        iconData:
                                                            Icons.arrow_forward,
                                                      )),
                                                ),
                                              )
                                            : SizedBox.shrink()),
                                  ],
                                ))
                            : chkStatus(chatuserdata.chatEnable)
                                ? GestureDetector(
                                    onTap: () {
                                      chkStatus(chatuserdata.chatEnable)
                                          ? Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChatRoomPage(
                                                        chatuserID:
                                                            chatuserdata.id ??
                                                                0,
                                                        IsAdminChat: false,
                                                      )))
                                          : showToast(
                                              "Please Wait for admin approval");
                                    },
                                    child: Container(
                                      height: 50,
                                      width: widget.devicewidth / 2 + 20,
                                      //  color: Colors.red,
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0, right: 0),
                                          child: ArrowBtn(
                                            height: 50,
                                            width: widget.devicewidth,
                                            bgclr: Appcolors.btnbggrey,
                                            btntxt: "Chat with me",
                                            icnclr: Appcolors.black,
                                            iconData: Icons.arrow_forward,
                                          )),
                                    ),
                                  )
                                : SizedBox.shrink()
                      ],
                    ))
              ],
            ),
          ),
        );
      },
    );
  }

  void ShowConsultationBox(int? id, Stocks? selectedStockDetails,
      double deviceheight, double devicewidth) {
    callCatApi(selectedStockDetails);

    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext context) {
        return Consumer<DashboardViewModel>(
            builder: (context, dashfildata, child) {
          return Container(
            height: deviceheight / 2 + 200,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
              child: Column(
                children: [
                  /*Consumer<DashboardViewModel>(
                      builder: (context, dashfildata, child) {
                        // print('dashfildata.catList length in adbro ${dashfildata.catList.length}');
                        // print('dashfildata.catList length in adbro2 ${dashfildata.dashboardFilterResponseModel?.data?.length}');
                        return dashfildata.state == ViewState.busy
                            ? Loader()
                            : StocksSections(
                            OnTopStocksPressed2: (selectedTopStocks2) {},
                            Filterdata: dashfildata.dashboardFilterResponseModel?.data ?? [],
                            OnIpoStocksPressed: (selectedIpoStocks) {},
                            OnTopStocksPressed: (selectedTopStocks) {
                              print(
                                  'Top Stocks Clicked name${selectedTopStocks
                                      ?.stock?.name ?? ""}');
                              print('Top Stocks Clicked id${selectedTopStocks
                                  ?.stock?.id ?? ""}');
                              if (selectedTopStocks?.stock != null) {
                                Provider.of<DropOptions>(context, listen: false).getDropOPtionsStockid(selectedTopStocks?.stock?.id);

                                //  Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreDetail(selectedstocks: selectedTopStocks?.stock,isExplore: true,)));
                              }
                            },
                            viewall: "viewall",
                            optionslist: dashfildata.catList,
                            firsttitle: "Select",
                            secondtitle: "Stocks",
                            ViewallClick: (viewallclick) {
                              print('viewall click 1 ${viewallclick}');

                              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>StockViewallPage(stockname: "Top Stocks")));
                            },
                            imagetag: "topstocksviewall",
                            items: [],
                            devicewidth: devicewidth,
                            featuredStocks: _dashboardViewModel
                                .dashboardResponseModel?.data?.featuredStocks,
                            ipostocks: []);
                      }
                  ),*/

                  Consumer<DropOptions>(builder: (context, consultCat, child) {
                    return ConsultCategoryDropDown(
                      dropdwnicon: LocalSVGImages.dropdwnpur,
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
                          consultCat.getDropOPtions(value);

                          Map<String, dynamic> filterparams = {
                            "category_id": value.id,
                            "type": "featured_stocks",
                            "age": "",
                            "sectors": "",
                            "city": "",
                          };

                          Provider.of<DashboardViewModel>(context,
                                  listen: false)
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
                    );
                  }),
                  SizedBox(
                    height: 16,
                  ),
                  Consumer<DropOptions>(
                      builder: (context, consultStock, child) {
                    //   consultStock.getDropStocks(SetStock(exmodel.exploreModel?.data?.stocks,selectedStockDetails));
                    print('selected stocks ${consultStock.dropStock?.name}');
                    return ConsultStockDropDown(
                      dropdwnicon: LocalSVGImages.dropdwnpur,
                      underlinecolor: Appcolors.kyctxtgrey,
                      iconcolor: Appcolors.kyctxtgrey,
                      textdecoration: CustomTextStyle.txt16Rmtxtpurp,
                      devicewidth: 130,
                      selectedValue: consultStock.dropStock,
                      //_selectedOption,
                      options: AddStocks(
                          dashfildata.dashboardFilterResponseModel?.data ?? []),
                      onChanged: (value) {
                        if (value != null) {
                          print('dropdown value ${value}');
                          consultStock.getDropStocks(value);
                          Provider.of<DropOptions>(context, listen: false)
                              .getDropOPtionsStockid(value.id);
                        } else {
                          print('value is null');
                        }

                        //  setState(() {
                        //  _selectedOption = value!;
                        // });
                      },
                    );
                  }),
                  buildNameandTxtfld2(
                      "Add Notes", _notescontrolller, TextInputType.name),
                  SizedBox(height: 18),
                  _consultationViewModel.state == ViewState.busy
                      ? Loader()
                      : Container(
                          height: 50,
                          child: CustomMaterialButton(
                            text: "Submit",
                            onPressed: () {
                              print(
                                  'dropoption cat name ${Provider.of<DropOptions>(context, listen: false).dropoptions?.categoryName}');
                              print(
                                  'dropoption stockname name ${Provider.of<DropOptions>(context, listen: false).dropStock?.name}');
                              print(
                                  'dropoption stock id ${Provider.of<DropOptions>(context, listen: false).stockid}');
                              print(
                                  'selectedstock cat name ${selectedStockDetails?.category?.categoryName}');
                              print(
                                  'selectedstock stock id ${selectedStockDetails?.id}');

                              if (id != null &&
                                  _notescontrolller.text != "" &&
                                  Provider.of<DropOptions>(context,
                                              listen: false)
                                          .dropStock
                                          ?.name !=
                                      null) {
                                print('Advisor id $id');
                                Map<String, dynamic> addCRparam = {
                                  "advisor_id": id.toString(),
                                  "notes": _notescontrolller.text,
                                  // "category_id":IsAdhlp?selectedStockDetails?.categoryId?.toString():"0",
                                  "category_id":
                                      PassCatId(IsAdhlp, selectedStockDetails)
                                          .toString(),
                                  //"stock_id":IsAdhlp?selectedStockDetails?.id?.toString():"0",
                                  "stock_id":
                                      PassStockId(IsAdhlp, selectedStockDetails)
                                          .toString()
                                };
                                print('addCRparam:: $addCRparam');
                                _consultationViewModel.ConsultRequestapi(
                                    onFailureRes: onConsultFailureRes,
                                    onSuccessRes: onConsultSuccessRes,
                                    addCRparam: addCRparam);
                              } else {
                                if (_notescontrolller.text == "") {
                                  return showToast("Please Enter Notes.");
                                } else if (Provider.of<DropOptions>(context,
                                            listen: false)
                                        .dropStock
                                        ?.name ==
                                    null) {
                                  return showToast("Please Select Stock.");
                                }
                              }
                            },
                          ),
                        )
                ],
              ),
            ),
          );
        });
      },
    );
  }

  onConsultFailureRes(String p1) {}

  onConsultSuccessRes(StatusandMessageModel? p1) {
    _notescontrolller.clear();
    showToast("Consultation Request sent.");
    Navigator.pop(context);
  }

  onFailureRes(String p1) {}

  onSuccessRes(DashboardResponseModel? dashres) {}

  void callCatApi(Stocks? selectedStockDetails) {
    print(
        'selected stock cat in api call ${selectedStockDetails?.category?.categoryName}');
    print(
        'drop null1 ${Provider.of<DropOptions>(context, listen: false).dropoptions?.categoryName}');
    Provider.of<DropOptions>(context, listen: false).getDropStocks(null);
    if (selectedStockDetails != null) {
      // Provider.of<DropOptions>(context, listen: false).getDropOPtions(selectedStockDetails.category);
      print(
          'drop null2 ${Provider.of<DropOptions>(context, listen: false).dropoptions?.categoryName}');
    }

    Map<String, dynamic> filterparams = {
      "category_id": selectedStockDetails?.category?.id ??
          Provider.of<DropOptions>(context, listen: false).dropoptions?.id ??
          1,
      "type": "featured_stocks",
      "age": "",
      "sectors": "",
      "city": "",
    };
    _dashboardViewModel.dashboardfilterapi(
        onFailureRes: onFilterFailureRes,
        onSuccessRes: onFilterfSuccessRes,
        filterparams: filterparams);
  }

  onFilterFailureRes(String p1) {}

  onFilterfSuccessRes(DashBoardFilterModel? p1) {}

  PassCatId(bool isAdhlp, Stocks? selectedStockDetails) {
    if (isAdhlp) {
      if (selectedStockDetails?.category?.id != null) {
        if (Provider.of<DropOptions>(context, listen: false).dropoptions?.id !=
            null) {
          if (selectedStockDetails?.category?.id ==
              Provider.of<DropOptions>(context, listen: false)
                  .dropoptions
                  ?.id) {
            return selectedStockDetails?.category?.id;
          } else {
            return Provider.of<DropOptions>(context, listen: false)
                .dropoptions
                ?.id;
          }
        } else {
          return selectedStockDetails?.category?.id;
        }
      }
    } else {
      return Provider.of<DropOptions>(context, listen: false).dropoptions?.id;
    }
  }

  PassStockId(bool isAdhlp, Stocks? selectedStockDetails) {
    if (isAdhlp) {
      if (selectedStockDetails?.id != null) {
        if (selectedStockDetails?.id ==
            Provider.of<DropOptions>(context, listen: false).stockid) {
          return selectedStockDetails?.id;
        } else {
          return Provider.of<DropOptions>(context, listen: false).stockid;
        }
      }
    } else {
      return Provider.of<DropOptions>(context, listen: false).stockid;
    }
  }

  onFilterSuccessRes(DashBoardFilterModel? p1) {}

  AddStocks(List<FDataa> list) {
    stocklist.clear();
    for (FDataa item in list) {
      stocklist.add(item.stock);
    }
    return stocklist;
  }
}

String? getMetaData(List<UserMetaData>? userMetaData, int i) {
  if (userMetaData != null && userMetaData.isNotEmpty) {
    for (UserMetaData item in userMetaData ?? []) {
      if (i == 1) {
        if (item.key == "done") {
          return item.value ?? "";
        }
      } else if (i == 2) {
        if (item.key == "service_year") {
          return item.value ?? "";
        }
      } else if (i == 3) {
        if (item.key == "expertise") {
          return item.value ?? "";
        }
      } else {
        return "NA";
      }
    }
  }
}

chkStatus(bool? chatEnable) {
  if (chatEnable != null && chatEnable) {
    return true;
  } else {
    return false;
  }
}

Padding buildpopupcontainers(
    double devicewidth, String title1, String subtitle1) {
  return Padding(
    padding: const EdgeInsets.only(left: 18.0, right: 18),
    child: Container(
      height: 40,
      width: devicewidth,
      //  color: Colors.red.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: devicewidth,
            //  color: Colors.red,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    flex: 1,
                    child: Text(title1,
                        style: CustomTextStyle.txt14gpquickstatsgrey,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis)),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    flex: 1,
                    child: Text(
                      subtitle1,
                      style: CustomTextStyle.txt14Rbtxtblk,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class ArrowBtn extends StatelessWidget {
  const ArrowBtn({
    super.key,
    required this.height,
    required this.width,
    required this.btntxt,
    required this.iconData,
    required this.bgclr,
    required this.icnclr,
  });

  final double height;
  final double width;
  final String btntxt;
  final IconData iconData;
  final Color bgclr;
  final Color icnclr;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: bgclr,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(btntxt, style: CustomTextStyle.txt14Rmtxtblk),
          SizedBox(width: 8.0),
          Icon(
            iconData,
            color: icnclr,
          ),
        ],
      ),
    );
  }
}
