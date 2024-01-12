
import 'package:flutter/cupertino.dart';

import '../ui/splash/splash.dart';

class CommonProvider extends ChangeNotifier {
  bool _isexpand = false;
  bool _isChecked = false;
  bool _isCurrentAdd = false;
  bool _isMobile = false;
  bool _isEmoji = false;
  bool _isUserDirSearch = false;
  bool _isSaudaInsights = false;
  bool _isAdvisorsSpeak = false;
  bool _isResendOTP = false;
  bool _isLastPage = false;
  bool _isVALastPage = false;
  bool _isToggle = false;
  bool _isFilterApi = false;
  String _isRollnale = "";
  String _isFilterRoll = "All";
  String _NoOfShares = "";
  String _SharePrice = "";
  String _SipLumpsum = "";
  String _Stockmessage = "";
  String _StockExpect = "";
  String _clname = "";
  String _clshares = "";
  String _clsellingcost = "";
  PushNotification? _notificationInfo;
  String _clnegoprice = "";
  String _clqtyhand = "";
  String _clnegoqty = "";
  String _clhigh = "";
  String _cllow = "";
  String _clrating = "";
  String _clremarks = "";
  String _clspa = "";
  String _claddinfo = "";
  String _exploreCatId = "";
  String _pageNoExplore = "";
  int _selectedIndex = 0;
  int _changeTab = -1;
  bool _isTriggerProfile = false;

  String _usernum = '';
  String _fcmtoken = '';
  String _loginnumber = '';

  String get UserNum => _usernum;
  String get IsFilterRoll => _isFilterRoll;
  String get ShareQty => _NoOfShares;
  String get SharePrice => _SharePrice;
  String get SipLumpsum => _SipLumpsum;
  String get StockMessage => _Stockmessage;
  String get StockExpect => _StockExpect;
  String get ExploreCatId => _exploreCatId;
  String get PageNoExplore => _pageNoExplore;
  bool get IsTriggerProfile => _isTriggerProfile;
  String get CLname => _clname;
  String get CLshares => _clshares;
  String get CLsellingcost => _clsellingcost;
  int get SelectedIndex => _selectedIndex;
  int get ChangeTab => _changeTab;
  PushNotification? get NotificationInfo => _notificationInfo;



  String get CLNegoPrice => _clnegoprice;
  String get CLNegoQty => _clnegoqty;
  String get CLQtyHnd => _clqtyhand;
  String get CLhigh => _clhigh;
  String get CLlow => _cllow;
  String get CLRating => _clrating;
  String get CLRemarks => _clremarks;
  String get CLSPA => _clspa;
  String get CLaddInfo => _claddinfo;



  String get FCMtoken => _fcmtoken;
  String get LoginNum => _loginnumber;
  String get RollNAme => _isRollnale;
  bool get IsExpand => _isexpand;
  bool get IsChecked => _isChecked;
  bool get IsCurrentAdd => _isCurrentAdd;
  bool get IsMobile => _isMobile;
  bool get IsEmoji => _isEmoji;
  bool get IsUserDirSearch => _isUserDirSearch;
  bool get IsSaudaInsights => _isSaudaInsights;
  bool get IsAdvisorsSpeak => _isAdvisorsSpeak;
  bool get IsResendOTP => _isResendOTP;
  bool get IsLastPage => _isLastPage;
  bool get IsVALastPage => _isVALastPage;
  bool get IsToggle => _isToggle;
  bool get IsFilterApi => _isFilterApi;


  void setIsTriggerProfile(bool value) {
    _isTriggerProfile = value;
    notifyListeners();
  }

  void setUserNum(String value) {
    _usernum = value;
    notifyListeners();
  }
  void setExploreCatId(String value) {
    _exploreCatId = value;
    notifyListeners();
  }
  void setPageNoExplore(String value) {
    _pageNoExplore = value;
    notifyListeners();
  }
  void setSelectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
  void setChangeTab(int value) {
    _changeTab = value;
    notifyListeners();
  }
  void setFilterRoll(String value) {
    _isFilterRoll = value;
    notifyListeners();
  }
  void setUserMobile(bool value) {
    _isMobile = value;
    notifyListeners();
  }
  void setSaudaInsights(bool value) {
    _isSaudaInsights = value;
    notifyListeners();
  }
  void setResendOTP(bool value) {
    _isResendOTP = value;
    notifyListeners();
  }
  void setAdvisorsSpeak(bool value) {
    _isAdvisorsSpeak = value;
    notifyListeners();
  }
  void setEmoji(bool value) {
    _isEmoji = value;
    notifyListeners();
  }
  void setUserDirSearch(bool value) {
    _isUserDirSearch = value;
    notifyListeners();
  }
 void setShareQty(String value) {
    _NoOfShares = value;
    notifyListeners();
  }
 void setSharePrice(String value) {
    _SharePrice = value;
    notifyListeners();
  }
  void setSipLumpsum(String value) {
    _SipLumpsum = value;
    notifyListeners();
  }
  void setStockMessage(String value) {
    _Stockmessage = value;
    notifyListeners();
  }
  void setStockExpect(String value) {
    _StockExpect = value;
    notifyListeners();
  }

  void setCLname(String value) {
    _clname = value;
    notifyListeners();
  }
  void setCLshares(String value) {
    _clshares = value;
    notifyListeners();
  }
  void setCLsellingcost(String value) {
    _clsellingcost = value;
    notifyListeners();
  }

  void setNotificationInfo(PushNotification? value) {
    _notificationInfo = value;
    notifyListeners();
  }

  void setCLNegoPce(String value) {
    _clnegoprice = value;
    notifyListeners();
  }
  void setCLNegoQty(String value) {
    _clnegoqty = value;
    notifyListeners();
  }
  void setCLQtyHnd(String value) {
    _clqtyhand = value;
    notifyListeners();
  }

  void setCLHigh(String value) {
    _clhigh = value;
    notifyListeners();
  }
 void setCLLow(String value) {
    _cllow = value;
    notifyListeners();
  }
  void setCLRating(String value) {
    _clrating = value;
    notifyListeners();
  }
  void setCLRemarks(String value) {
    _clremarks = value;
    notifyListeners();
  }
  void setCLSPA(String value) {
    _clspa = value;
    notifyListeners();
  }
void setCLAddInfo(String value) {
    _claddinfo = value;
    notifyListeners();
  }

  void setFCM(String value) {
    _fcmtoken = value;
    notifyListeners();
  }
  void setLoginNum(String value) {
    _loginnumber = value;
    notifyListeners();
  }
  void setRollName(String value) {
    _isRollnale = value;
    notifyListeners();
  }

  void setIsExpand(bool value) {
    _isexpand = value;
    notifyListeners();
  }
  void setIsChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }
  void setIsCurrentAdd(bool value) {
    _isCurrentAdd = value;
    notifyListeners();
  }
  void setIsLastPage(bool value) {
    _isLastPage = value;
    notifyListeners();
  }
  void setIsVALastPage(bool value) {
    _isVALastPage = value;
    notifyListeners();
  }
  void setIsToggle(bool value) {
    _isToggle = value;
    notifyListeners();
  }
  void setIsFilterApi(bool value) {
    _isFilterApi = value;
    notifyListeners();
  }

}