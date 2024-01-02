import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:base_flutter_provider_project/data/models/User_Directory_model/ChatUsersList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/appbar_widgets/WhiteAppbar.dart';
import '../../../common_widgets/my_trans_widget/PurchaseRequested.dart';
import '../../../common_widgets/my_trans_widget/Sold.dart';
import '../../../common_widgets/search_widgets/common_search.dart';
import '../../../common_widgets/tablayout/common_tablayout.dart';
import '../../../constants/local_images.dart';
import '../../../viewModel/ChatUsers_view_model.dart';
import 'UserDirectUI.dart';

class DealerUserDirectory extends StatefulWidget {
  const DealerUserDirectory({super.key});

  @override
  State<DealerUserDirectory> createState() => _DealerUserDirectoryState();
}

class _DealerUserDirectoryState extends State<DealerUserDirectory> with SingleTickerProviderStateMixin{
  late ChatUsersViewModel _chatusersViewModel;
  late TabController _tabController;
  final List<String> userdirecttabs = ["Standard Users","Dealers & Brokers","Advisors"];
  final List<TabData> tabs = [];
  late final int Tablength;
  @override
  void initState() {
    super.initState();
 //   _tabController = TabController(length: 3, vsync: this);
    addTabContent();
    Tablength = userdirecttabs.length;
    _tabController = TabController(length: Tablength, initialIndex: 0,vsync: this);
    print('userdirectry length ${_tabController.length}');
    //_tabController.addListener(_updateBackgroundColor);
    _chatusersViewModel =  Provider.of<ChatUsersViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _chatusersViewModel.getchatusersapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes);
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: WhiteAppbarwithIcon(
        backgroundColor: Colors.white,
        title: "User Directory",
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Hero(
              tag: "userdirecfilter",
              child: Row(
                children: [
                  SvgPicture.asset(LocalSVGImages.filter, height: 20, width: 15),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: deviceheight,
        width: devicewidth,
        child: Column(
          children: [
             /* CommonSearch(
              hinttxt: "Search users by name, or industry",
              onSearchTextChanged: (text) {},
            ),*/
            Expanded(
              child: Container(
                height: deviceheight,
                width: devicewidth,
                color: Colors.white,
                child: CommonTabLayout(
                  IsExplore: true,
                  DynamicTabs: tabs,
                  tabTitles:userdirecttabs,
                  tabContents: [],
                  tabController: _tabController,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void addTabContent() {
    for(var i=0; i< userdirecttabs.length; i++){
      tabs.add(
          TabData(title: userdirecttabs[i] ?? "",
            content:  UserDirUI(directoryindex: i)
         //   Center(child: Text('Content for Tab $i') ),
          ));
    }
  }

  onFailureRes(String p1) {
  }



  onSuccessRes(ChatUsersList? Userlist) {
    if (Userlist?.data != null && Userlist?.data?.users != null) {
      Users newUser = Users(
        name: '',
        status: null,
        createdAt: "",
        about: "",
        active: "",
        authToken: "",
        blocked: null,
        city: "",
        customerId: "",
        email: "",
        emailVerifiedAt: "",
        facebookId: "",
        fcmTokan: "",
        featured: null,
        googleId: "",
        id: null,
        idProof: null,
        mobile: "",
        mobileVerifiedAt: "",
        photo: "",
        professionId: null,
        professionName: "",
        referalCode: "",
        roleId: null,
        roleName: "",
        state: "",
        updatedAt: "",

        photoUrl: 'http://sauda.wipspace.in/assets/images/users/user.png', // Set the image property to the desired value.
        // Add other properties as needed.
      );
     // Userlist?.data?.users?.add(newUser);    // it adds in last index
      // Insert the new user at index 0.
      Userlist?.data?.users?.insert(0, newUser);
    }if (Userlist?.data != null && Userlist?.data?.dealers != null) {
      Users newUser = Users(
        name: '',
        status: null,
        createdAt: "",
        about: "",
        active: "",
        authToken: "",
        blocked: null,
        city: "",
        customerId: "",
        email: "",
        emailVerifiedAt: "",
        facebookId: "",
        fcmTokan: "",
        featured: null,
        googleId: "",
        id: null,
        idProof: null,
        mobile: "",
        mobileVerifiedAt: "",
        photo: "",
        professionId: null,
        professionName: "",
        referalCode: "",
        roleId: null,
        roleName: "",
        state: "",
        updatedAt: "",

        photoUrl: 'http://sauda.wipspace.in/assets/images/users/user.png', // Set the image property to the desired value.
        // Add other properties as needed.
      );
     // Userlist?.data?.users?.add(newUser);    // it adds in last index
      // Insert the new user at index 0.
      Userlist?.data?.dealers?.insert(0, newUser);
    }
    if (Userlist?.data != null && Userlist?.data?.advisors != null) {
      Users newUser = Users(
        name: '',
        status: null,
        createdAt: "",
        about: "",
        active: "",
        authToken: "",
        blocked: null,
        city: "",
        customerId: "",
        email: "",
        emailVerifiedAt: "",
        facebookId: "",
        fcmTokan: "",
        featured: null,
        googleId: "",
        id: null,
        idProof: null,
        mobile: "",
        mobileVerifiedAt: "",
        photo: "",
        professionId: null,
        professionName: "",
        referalCode: "",
        roleId: null,
        roleName: "",
        state: "",
        updatedAt: "",

        photoUrl: 'http://sauda.wipspace.in/assets/images/users/user.png', // Set the image property to the desired value.
        // Add other properties as needed.
      );
     // Userlist?.data?.users?.add(newUser);    // it adds in last index
      // Insert the new user at index 0.
      Userlist?.data?.advisors?.insert(0, newUser);
    }
  }
}
