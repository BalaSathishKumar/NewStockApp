
class ChatHistoryModel {
  ChatHistoryModel({
      bool? status, 
      List<Chat>? chat,}){
    _status = status;
    _chat = chat;
}

  ChatHistoryModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['chat'] != null) {
      _chat = [];
      json['chat'].forEach((v) {
        _chat?.add(Chat.fromJson(v));
      });
    }
  }
  bool? _status;
  List<Chat>? _chat;
ChatHistoryModel copyWith({  bool? status,
  List<Chat>? chat,
}) => ChatHistoryModel(  status: status ?? _status,
  chat: chat ?? _chat,
);
  bool? get status => _status;
  List<Chat>? get chat => _chat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_chat != null) {
      map['chat'] = _chat?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Chat {
  Chat({
      int? id,
      num? userOneId, 
      num? userTwoId, 
      num? adminId, 
      num? status, 
      String? createdAt, 
      String? updatedAt,
      Sender? sender,
    Messages? messages,
    Userone? userone, 
      Usertwo? usertwo, 
      dynamic? admin,
     
  }){
    _id = id;
    _userOneId = userOneId;
    _userTwoId = userTwoId;
    _adminId = adminId;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _sender = sender;
    _messages = messages;
    _userone = userone;
    _usertwo = usertwo;
    _admin = admin;
    
}

  Chat.fromJson(dynamic json) {
    _id = json['id'];
    _userOneId = json['user_one_id'];
    _userTwoId = json['user_two_id'];
    _adminId = json['admin_id'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _sender = json['sender'] != null ? Sender.fromJson(json['sender']) : null;
    _messages = json['message'] != null ? Messages.fromJson(json['message']) : null;
    _userone = json['userone'] != null ? Userone.fromJson(json['userone']) : null;
    _usertwo = json['usertwo'] != null ? Usertwo.fromJson(json['usertwo']) : null;
    _admin = json['admin'];
  
/*    if (json['messages'] != null) {
      _messages = [];
      json['messages'].forEach((v) {
        _messages?.add(Messages.fromJson(v));
      });
    }*/
  }
  int? _id;
  num? _userOneId;
  num? _userTwoId;
  num? _adminId;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  Sender? _sender;
  Messages? _messages;
  Userone? _userone;
  Usertwo? _usertwo;
  dynamic? _admin;

Chat copyWith({  int? id,
  num? userOneId,
  num? userTwoId,
  num? adminId,
  num? status,
  String? createdAt,
  String? updatedAt,
  Sender? sender,
  Messages? messages,
  Userone? userone,
  Usertwo? usertwo,
  dynamic? admin,

}) => Chat(  id: id ?? _id,
  userOneId: userOneId ?? _userOneId,
  userTwoId: userTwoId ?? _userTwoId,
  adminId: adminId ?? _adminId,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  sender: sender ?? _sender,
  messages: messages ?? _messages,
  userone: userone ?? _userone,
  usertwo: usertwo ?? _usertwo,
  admin: admin ?? _admin,

);
  int? get id => _id;
  num? get userOneId => _userOneId;
  num? get userTwoId => _userTwoId;
  num? get adminId => _adminId;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Sender? get sender => _sender;
  Messages? get messages => _messages;
  Userone? get userone => _userone;
  Usertwo? get usertwo => _usertwo;
  dynamic? get admin => _admin;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_one_id'] = _userOneId;
    map['user_two_id'] = _userTwoId;
    map['admin_id'] = _adminId;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_sender != null) {
      map['sender'] = _sender?.toJson();
    }
    if (_messages != null) {
      map['message'] = _messages?.toJson();
      // map['messages'] = _messages?.map((v) => v.toJson()).toList();
    }
    if (_userone != null) {
      map['userone'] = _userone?.toJson();
    }
    if (_usertwo != null) {
      map['usertwo'] = _usertwo?.toJson();
    }
    map['admin'] = _admin;

    return map;
  }

}

class Sender {
  Sender({
    int? id,
    String? name,
    String? mobile,
    String? email,
    String? city,
    String? state,
    num? professionId,
    String? customerId,
    String? photo,
    String? about,
    String? referalCode,
    String? emailVerifiedAt,
    String? mobileVerifiedAt,
    String? authToken,
    dynamic fcmTokan,
    String? facebookId,
    String? googleId,
    num? roleId,
    num? featured,
    num? status,
    String? active,
    String? createdAt,
    String? updatedAt,
    String? roleName,
    String? professionName,
    String? photoUrl,
    List<IdProof>? idProof,
    List<UserMetaData>? userMetaData,
    List<UserProfession>? userProfession,}){
    _id = id;
    _name = name;
    _mobile = mobile;
    _email = email;
    _city = city;
    _state = state;
    _professionId = professionId;
    _customerId = customerId;
    _photo = photo;
    _about = about;
    _referalCode = referalCode;
    _emailVerifiedAt = emailVerifiedAt;
    _mobileVerifiedAt = mobileVerifiedAt;
    _authToken = authToken;
    _fcmTokan = fcmTokan;
    _facebookId = facebookId;
    _googleId = googleId;
    _roleId = roleId;
    _featured = featured;
    _status = status;
    _active = active;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _roleName = roleName;
    _professionName = professionName;
    _photoUrl = photoUrl;
    _idProof = idProof;
    _userMetaData = userMetaData;
    _userProfession = userProfession;
  }

  Sender.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _mobile = json['mobile'];
    _email = json['email'];
    _city = json['city'];
    _state = json['state'];
    _professionId = json['profession_id'];
    _customerId = json['customer_id'];
    _photo = json['photo'];
    _about = json['about'];
    _referalCode = json['referal_code'];
    _emailVerifiedAt = json['email_verified_at'];
    _mobileVerifiedAt = json['mobile_verified_at'];
    _authToken = json['auth_token'];
    _fcmTokan = json['fcm_tokan'];
    _facebookId = json['facebook_id'];
    _googleId = json['google_id'];
    _roleId = json['role_id'];
    _featured = json['featured'];
    _status = json['status'];
    _active = json['active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _roleName = json['role_name'];
    _professionName = json['profession_name'];
    _photoUrl = json['photo_url'];
    if (json['id_proof'] != null) {
      _idProof = [];
      json['id_proof'].forEach((v) {
        _idProof?.add(IdProof.fromJson(v));
      });
    }
    if (json['user_meta_data'] != null) {
      _userMetaData = [];
      json['user_meta_data'].forEach((v) {
        _userMetaData?.add(UserMetaData.fromJson(v));
      });
    }
    if (json['user_profession'] != null) {
      _userProfession = [];
      json['user_profession'].forEach((v) {
        _userProfession?.add(UserProfession.fromJson(v));
      });
    }
  }
  int? _id;
  String? _name;
  String? _mobile;
  String? _email;
  String? _city;
  String? _state;
  num? _professionId;
  String? _customerId;
  String? _photo;
  String? _about;
  String? _referalCode;
  String? _emailVerifiedAt;
  String? _mobileVerifiedAt;
  String? _authToken;
  dynamic _fcmTokan;
  String? _facebookId;
  String? _googleId;
  num? _roleId;
  num? _featured;
  num? _status;
  String? _active;
  String? _createdAt;
  String? _updatedAt;
  String? _roleName;
  String? _professionName;
  String? _photoUrl;
  List<IdProof>? _idProof;
  List<UserMetaData>? _userMetaData;
  List<UserProfession>? _userProfession;
  Sender copyWith({  int? id,
    String? name,
    String? mobile,
    String? email,
    String? city,
    String? state,
    num? professionId,
    String? customerId,
    String? photo,
    String? about,
    String? referalCode,
    String? emailVerifiedAt,
    String? mobileVerifiedAt,
    String? authToken,
    dynamic fcmTokan,
    String? facebookId,
    String? googleId,
    num? roleId,
    num? featured,
    num? status,
    String? active,
    String? createdAt,
    String? updatedAt,
    String? roleName,
    String? professionName,
    String? photoUrl,
    List<IdProof>? idProof,
    List<UserMetaData>? userMetaData,
    List<UserProfession>? userProfession,
  }) => Sender(  id: id ?? _id,
    name: name ?? _name,
    mobile: mobile ?? _mobile,
    email: email ?? _email,
    city: city ?? _city,
    state: state ?? _state,
    professionId: professionId ?? _professionId,
    customerId: customerId ?? _customerId,
    photo: photo ?? _photo,
    about: about ?? _about,
    referalCode: referalCode ?? _referalCode,
    emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
    mobileVerifiedAt: mobileVerifiedAt ?? _mobileVerifiedAt,
    authToken: authToken ?? _authToken,
    fcmTokan: fcmTokan ?? _fcmTokan,
    facebookId: facebookId ?? _facebookId,
    googleId: googleId ?? _googleId,
    roleId: roleId ?? _roleId,
    featured: featured ?? _featured,
    status: status ?? _status,
    active: active ?? _active,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    roleName: roleName ?? _roleName,
    professionName: professionName ?? _professionName,
    photoUrl: photoUrl ?? _photoUrl,
    idProof: idProof ?? _idProof,
    userMetaData: userMetaData ?? _userMetaData,
    userProfession: userProfession ?? _userProfession,
  );
  int? get id => _id;
  String? get name => _name;
  String? get mobile => _mobile;
  String? get email => _email;
  String? get city => _city;
  String? get state => _state;
  num? get professionId => _professionId;
  String? get customerId => _customerId;
  String? get photo => _photo;
  String? get about => _about;
  String? get referalCode => _referalCode;
  String? get emailVerifiedAt => _emailVerifiedAt;
  String? get mobileVerifiedAt => _mobileVerifiedAt;
  String? get authToken => _authToken;
  dynamic get fcmTokan => _fcmTokan;
  String? get facebookId => _facebookId;
  String? get googleId => _googleId;
  num? get roleId => _roleId;
  num? get featured => _featured;
  num? get status => _status;
  String? get active => _active;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get roleName => _roleName;
  String? get professionName => _professionName;
  String? get photoUrl => _photoUrl;
  List<IdProof>? get idProof => _idProof;
  List<UserMetaData>? get userMetaData => _userMetaData;
  List<UserProfession>? get userProfession => _userProfession;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['city'] = _city;
    map['state'] = _state;
    map['profession_id'] = _professionId;
    map['customer_id'] = _customerId;
    map['photo'] = _photo;
    map['about'] = _about;
    map['referal_code'] = _referalCode;
    map['email_verified_at'] = _emailVerifiedAt;
    map['mobile_verified_at'] = _mobileVerifiedAt;
    map['auth_token'] = _authToken;
    map['fcm_tokan'] = _fcmTokan;
    map['facebook_id'] = _facebookId;
    map['google_id'] = _googleId;
    map['role_id'] = _roleId;
    map['featured'] = _featured;
    map['status'] = _status;
    map['active'] = _active;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['role_name'] = _roleName;
    map['profession_name'] = _professionName;
    map['photo_url'] = _photoUrl;
    if (_idProof != null) {
      map['id_proof'] = _idProof?.map((v) => v.toJson()).toList();
    }
    if (_userMetaData != null) {
      map['user_meta_data'] = _userMetaData?.map((v) => v.toJson()).toList();
    }
    if (_userProfession != null) {
      map['user_profession'] = _userProfession?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
/// id : 351
/// cr_id : 17
/// user_id : 182
/// message : "fhhgh"
/// image : ""
/// message_type : "text"
/// user_type : "user"
/// status : 1
/// created_at : "2023-09-13T13:50:00.000000Z"
/// updated_at : "2023-09-13T13:50:00.000000Z"
/// user : {"id":182,"name":"createlistdealr1","mobile":"2222222222","email":"ddddd@gmail.com","city":"Madurai","state":"Tamil Nadu","profession_id":0,"customer_id":"cust_MawHqBbZMCpEla","photo":"photo_65167.jpg","about":"Ghjjk","referal_code":"TlyaIr7hMB","email_verified_at":null,"mobile_verified_at":null,"auth_token":"a4ee88179df9c6588485eca28991b739","fcm_tokan":null,"facebook_id":"","google_id":"","role_id":2,"featured":0,"status":2,"active":"online","created_at":"2023-09-11T07:02:20.000000Z","updated_at":"2023-10-11T05:08:32.000000Z","role_name":"Brokers","profession_name":"","photo_url":"http://sauda.wipspace.in/storage/profile_photo/photo_65167.jpg","id_proof":[{"id":144,"user_id":182,"proof_name":"id_proof","name":"Aadhar","path":"id_proof_725.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/id_proof_725.jpg"},{"id":145,"user_id":182,"proof_name":"company_proof","name":"Company ownership","path":"company_proof_79365.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/company_proof_79365.jpg"},{"id":146,"user_id":182,"proof_name":"pan_card","name":"Pan Card","path":"pan_card_11147.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/pan_card_11147.jpg"},{"id":147,"user_id":182,"proof_name":"recognitions_photo","name":"Recognitions","path":"recognitions_photo_38443.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/recognitions_photo_38443.jpg"},{"id":148,"user_id":182,"proof_name":"cancelled_cheque","name":"Cancelled Cheque","path":"cancelled_cheque_47023.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/cancelled_cheque_47023.jpg"},{"id":149,"user_id":182,"proof_name":"client_master","name":"Client Master","path":"company_proof_78997.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/company_proof_78997.jpg"},{"id":150,"user_id":182,"proof_name":"sebi_registration_certificate","name":"SEBI Registration Certificate","path":"sebi_registration_certificate_52402.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/sebi_registration_certificate_52402.jpg"},{"id":172,"user_id":182,"proof_name":"id_proof","name":"Aadhar","path":"id_proof_59477.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/id_proof_59477.jpg"},{"id":173,"user_id":182,"proof_name":"company_proof","name":"Company ownership","path":"company_proof_83378.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/company_proof_83378.jpg"},{"id":174,"user_id":182,"proof_name":"pan_card","name":"Pan Card","path":"pan_card_90141.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/pan_card_90141.jpg"},{"id":175,"user_id":182,"proof_name":"recognitions_photo","name":"Recognitions","path":"recognitions_photo_85817.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/recognitions_photo_85817.jpg"},{"id":176,"user_id":182,"proof_name":"cancelled_cheque","name":"Cancelled Cheque","path":"cancelled_cheque_32036.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/cancelled_cheque_32036.jpg"},{"id":177,"user_id":182,"proof_name":"sebi_registration_certificate","name":"SEBI Registration Certificate","path":"sebi_registration_certificate_99320.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/sebi_registration_certificate_99320.jpg"}],"user_meta_data":[{"id":385,"user_id":182,"key":"father_name","value":"Tesfather","status":1,"created_at":"2023-09-29T05:19:15.000000Z","updated_at":"2023-09-29T06:52:05.000000Z"},{"id":386,"user_id":182,"key":"date_of_birth","value":"9/29/2023","status":1,"created_at":"2023-09-29T05:19:15.000000Z","updated_at":"2023-09-29T06:52:05.000000Z"},{"id":387,"user_id":182,"key":"gender","value":"Male","status":1,"created_at":"2023-09-29T05:19:15.000000Z","updated_at":"2023-09-29T06:52:05.000000Z"},{"id":388,"user_id":182,"key":"age","value":"28","status":1,"created_at":"2023-09-29T05:19:15.000000Z","updated_at":"2023-09-29T06:52:05.000000Z"},{"id":389,"user_id":182,"key":"residential","value":"Foreign Nation","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":390,"user_id":182,"key":"pan_number","value":"123456565656","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":391,"user_id":182,"key":"current_address","value":"abservetech","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":392,"user_id":182,"key":"permanent_address","value":"abservetech","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":393,"user_id":182,"key":"service_year","value":"2 Years","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":394,"user_id":182,"key":"expertise","value":"fjfjfjf","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":395,"user_id":182,"key":"volume_deals_done","value":"test1test2test3","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z"},{"id":396,"user_id":182,"key":"name_depository","value":"test4","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":397,"user_id":182,"key":"depository_participant_dp_id","value":"test5","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":398,"user_id":182,"key":"depository","value":"test6","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":399,"user_id":182,"key":"depository_client_dp_id","value":"test7","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":459,"user_id":182,"key":"volume","value":"ddfgdfgdg","status":1,"created_at":"2023-10-03T10:40:23.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":460,"user_id":182,"key":"deals","value":"rert","status":1,"created_at":"2023-10-03T10:40:23.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":461,"user_id":182,"key":"done","value":"ertet","status":1,"created_at":"2023-10-03T10:40:23.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":462,"user_id":182,"key":"residential","value":"Foreign Nation","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":463,"user_id":182,"key":"pan_number","value":"123456565656","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":464,"user_id":182,"key":"current_address","value":"abservetech","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":465,"user_id":182,"key":"permanent_address","value":"abservetech","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":466,"user_id":182,"key":"service_year","value":"2 Years","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":467,"user_id":182,"key":"expertise","value":"fjfjfjf","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":468,"user_id":182,"key":"name_depository","value":"test4","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":469,"user_id":182,"key":"depository_participant_dp_id","value":"test5","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":470,"user_id":182,"key":"depository","value":"test6","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":471,"user_id":182,"key":"depository_client_dp_id","value":"test7","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"}],"user_profession":[{"id":229,"user_id":182,"profession_id":62,"status":1,"created_at":"2023-09-29T06:52:05.000000Z","updated_at":"2023-09-29T06:52:05.000000Z","profession":{"id":62,"name":"Teacher","status":1,"created_at":"2022-09-27T15:00:00.000000Z","updated_at":"2022-09-27T15:00:00.000000Z"}}]}
/// file_url : ""
/// admin : {}
/// room : {"id":17,"user_one_id":182,"user_two_id":1,"admin_id":0,"status":1,"created_at":"2023-09-13T13:50:00.000000Z","updated_at":"2023-09-13T13:50:00.000000Z","userone":{"id":182,"name":"createlistdealr1","mobile":"2222222222","email":"ddddd@gmail.com","city":"Madurai","state":"Tamil Nadu","profession_id":0,"customer_id":"cust_MawHqBbZMCpEla","photo":"photo_65167.jpg","about":"Ghjjk","referal_code":"TlyaIr7hMB","email_verified_at":null,"mobile_verified_at":null,"auth_token":"a4ee88179df9c6588485eca28991b739","fcm_tokan":null,"facebook_id":"","google_id":"","role_id":2,"featured":0,"status":2,"active":"online","created_at":"2023-09-11T07:02:20.000000Z","updated_at":"2023-10-11T05:08:32.000000Z","role_name":"Brokers","profession_name":"","photo_url":"http://sauda.wipspace.in/storage/profile_photo/photo_65167.jpg","id_proof":[{"id":144,"user_id":182,"proof_name":"id_proof","name":"Aadhar","path":"id_proof_725.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/id_proof_725.jpg"},{"id":145,"user_id":182,"proof_name":"company_proof","name":"Company ownership","path":"company_proof_79365.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/company_proof_79365.jpg"},{"id":146,"user_id":182,"proof_name":"pan_card","name":"Pan Card","path":"pan_card_11147.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/pan_card_11147.jpg"},{"id":147,"user_id":182,"proof_name":"recognitions_photo","name":"Recognitions","path":"recognitions_photo_38443.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/recognitions_photo_38443.jpg"},{"id":148,"user_id":182,"proof_name":"cancelled_cheque","name":"Cancelled Cheque","path":"cancelled_cheque_47023.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/cancelled_cheque_47023.jpg"},{"id":149,"user_id":182,"proof_name":"client_master","name":"Client Master","path":"company_proof_78997.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/company_proof_78997.jpg"},{"id":150,"user_id":182,"proof_name":"sebi_registration_certificate","name":"SEBI Registration Certificate","path":"sebi_registration_certificate_52402.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/sebi_registration_certificate_52402.jpg"},{"id":172,"user_id":182,"proof_name":"id_proof","name":"Aadhar","path":"id_proof_59477.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/id_proof_59477.jpg"},{"id":173,"user_id":182,"proof_name":"company_proof","name":"Company ownership","path":"company_proof_83378.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/company_proof_83378.jpg"},{"id":174,"user_id":182,"proof_name":"pan_card","name":"Pan Card","path":"pan_card_90141.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/pan_card_90141.jpg"},{"id":175,"user_id":182,"proof_name":"recognitions_photo","name":"Recognitions","path":"recognitions_photo_85817.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/recognitions_photo_85817.jpg"},{"id":176,"user_id":182,"proof_name":"cancelled_cheque","name":"Cancelled Cheque","path":"cancelled_cheque_32036.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/cancelled_cheque_32036.jpg"},{"id":177,"user_id":182,"proof_name":"sebi_registration_certificate","name":"SEBI Registration Certificate","path":"sebi_registration_certificate_99320.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/sebi_registration_certificate_99320.jpg"}],"user_meta_data":[{"id":385,"user_id":182,"key":"father_name","value":"Tesfather","status":1,"created_at":"2023-09-29T05:19:15.000000Z","updated_at":"2023-09-29T06:52:05.000000Z"},{"id":386,"user_id":182,"key":"date_of_birth","value":"9/29/2023","status":1,"created_at":"2023-09-29T05:19:15.000000Z","updated_at":"2023-09-29T06:52:05.000000Z"},{"id":387,"user_id":182,"key":"gender","value":"Male","status":1,"created_at":"2023-09-29T05:19:15.000000Z","updated_at":"2023-09-29T06:52:05.000000Z"},{"id":388,"user_id":182,"key":"age","value":"28","status":1,"created_at":"2023-09-29T05:19:15.000000Z","updated_at":"2023-09-29T06:52:05.000000Z"},{"id":389,"user_id":182,"key":"residential","value":"Foreign Nation","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":390,"user_id":182,"key":"pan_number","value":"123456565656","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":391,"user_id":182,"key":"current_address","value":"abservetech","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":392,"user_id":182,"key":"permanent_address","value":"abservetech","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":393,"user_id":182,"key":"service_year","value":"2 Years","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":394,"user_id":182,"key":"expertise","value":"fjfjfjf","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":395,"user_id":182,"key":"volume_deals_done","value":"test1test2test3","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z"},{"id":396,"user_id":182,"key":"name_depository","value":"test4","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":397,"user_id":182,"key":"depository_participant_dp_id","value":"test5","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":398,"user_id":182,"key":"depository","value":"test6","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":399,"user_id":182,"key":"depository_client_dp_id","value":"test7","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":459,"user_id":182,"key":"volume","value":"ddfgdfgdg","status":1,"created_at":"2023-10-03T10:40:23.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":460,"user_id":182,"key":"deals","value":"rert","status":1,"created_at":"2023-10-03T10:40:23.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":461,"user_id":182,"key":"done","value":"ertet","status":1,"created_at":"2023-10-03T10:40:23.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":462,"user_id":182,"key":"residential","value":"Foreign Nation","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":463,"user_id":182,"key":"pan_number","value":"123456565656","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":464,"user_id":182,"key":"current_address","value":"abservetech","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":465,"user_id":182,"key":"permanent_address","value":"abservetech","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":466,"user_id":182,"key":"service_year","value":"2 Years","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":467,"user_id":182,"key":"expertise","value":"fjfjfjf","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":468,"user_id":182,"key":"name_depository","value":"test4","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":469,"user_id":182,"key":"depository_participant_dp_id","value":"test5","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":470,"user_id":182,"key":"depository","value":"test6","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":471,"user_id":182,"key":"depository_client_dp_id","value":"test7","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"}],"user_profession":[{"id":229,"user_id":182,"profession_id":62,"status":1,"created_at":"2023-09-29T06:52:05.000000Z","updated_at":"2023-09-29T06:52:05.000000Z","profession":{"id":62,"name":"Teacher","status":1,"created_at":"2022-09-27T15:00:00.000000Z","updated_at":"2022-09-27T15:00:00.000000Z"}}]},"usertwo":{"id":1,"name":"Boopathi","mobile":"8760083370","email":"boopathi@yahoo.com","city":"Beri Khas","state":"Haryana","profession_id":1,"customer_id":"cust_MYc4ZYYGHNTyuz","photo":"photo_58061.jpg","about":"Twstijjsu","referal_code":"cPhRaw4E","email_verified_at":"2022-09-28T06:08:00.000000Z","mobile_verified_at":"2022-09-28T06:08:00.000000Z","auth_token":"ecb53432cbb743a2e847a6014d1e725b","fcm_tokan":null,"facebook_id":"1234567890","google_id":"","role_id":1,"featured":0,"status":1,"active":"online","created_at":"2022-09-27T15:00:00.000000Z","updated_at":"2023-10-10T08:02:20.000000Z","role_name":"Users","profession_name":"Accountant","photo_url":"http://sauda.wipspace.in/storage/profile_photo/photo_58061.jpg","id_proof":[{"id":53,"user_id":1,"proof_name":"id_proof","name":"Aadhar Card","path":"back-arrow_17248.png","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/back-arrow_17248.png"},{"id":54,"user_id":1,"proof_name":"company_proof","name":"Company ownership","path":"filter_41070.png","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/filter_41070.png"},{"id":55,"user_id":1,"proof_name":"pan_card","name":"Pan Card","path":"unlistbg_62973.png","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/unlistbg_62973.png"},{"id":56,"user_id":1,"proof_name":"recognitions_photo","name":"Recognitions","path":"unlistbg_71050.png","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/unlistbg_71050.png"},{"id":57,"user_id":1,"proof_name":"cancelled_cheque","name":"Cancelled Cheque","path":"edit_9157.png","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/edit_9157.png"},{"id":58,"user_id":1,"proof_name":"client_master","name":"Client Master","path":"mobile_43491.png","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/mobile_43491.png"},{"id":59,"user_id":1,"proof_name":"id_proof","name":"Aadhar Card","path":"back-arrow_43190.png","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/back-arrow_43190.png"},{"id":60,"user_id":1,"proof_name":"pan_card","name":"Pan Card","path":"unlistbg_63667.png","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/unlistbg_63667.png"},{"id":61,"user_id":1,"proof_name":"recognitions_photo","name":"Recognitions","path":"unlistbg_81880.png","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/unlistbg_81880.png"},{"id":62,"user_id":1,"proof_name":"cancelled_cheque","name":"Cancelled Cheque","path":"edit_64387.png","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/edit_64387.png"},{"id":63,"user_id":1,"proof_name":"client_master","name":"Client Master","path":"mobile_59162.png","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/mobile_59162.png"}],"user_meta_data":[{"id":17,"user_id":1,"key":"residential","value":"Resident Individual","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z"},{"id":18,"user_id":1,"key":"pan_number","value":"12345678","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z"},{"id":19,"user_id":1,"key":"current_address","value":"coimbatore","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z"},{"id":20,"user_id":1,"key":"permanent_address","value":"erode","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z"},{"id":21,"user_id":1,"key":"service_year","value":"30","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z"},{"id":22,"user_id":1,"key":"residential","value":"Resident Individual","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z"},{"id":23,"user_id":1,"key":"pan_number","value":"12345678","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z"},{"id":24,"user_id":1,"key":"current_address","value":"coimbatore","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z"},{"id":25,"user_id":1,"key":"permanent_address","value":"erode","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z"},{"id":32,"user_id":1,"key":"father_name","value":"Testing","status":1,"created_at":"2023-09-05T09:59:07.000000Z","updated_at":"2023-09-28T15:15:58.000000Z"},{"id":33,"user_id":1,"key":"date_of_birth","value":"9/28/2023","status":1,"created_at":"2023-09-05T09:59:07.000000Z","updated_at":"2023-09-28T15:15:58.000000Z"},{"id":34,"user_id":1,"key":"gender","value":"Male","status":1,"created_at":"2023-09-05T09:59:07.000000Z","updated_at":"2023-09-28T15:15:58.000000Z"},{"id":384,"user_id":1,"key":"age","value":"28","status":1,"created_at":"2023-09-28T15:15:09.000000Z","updated_at":"2023-09-28T15:15:58.000000Z"}],"user_profession":[{"id":226,"user_id":1,"profession_id":1,"status":1,"created_at":"2023-09-28T15:15:58.000000Z","updated_at":"2023-09-28T15:15:58.000000Z","profession":{"id":1,"name":"Accountant","status":1,"created_at":"2022-09-27T15:00:00.000000Z","updated_at":"2022-09-27T15:00:00.000000Z"}}]},"admin":false}

class Messages {
  Messages({
      num? id, 
      num? crId, 
      num? userId, 
      String? message, 
      String? image, 
      String? messageType, 
      String? userType, 
      num? status, 
      String? createdAt, 
      String? updatedAt, 
      User? user, 
      String? fileUrl, 
      dynamic admin, 
      Room? room,}){
    _id = id;
    _crId = crId;
    _userId = userId;
    _message = message;
    _image = image;
    _messageType = messageType;
    _userType = userType;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _user = user;
    _fileUrl = fileUrl;
    _admin = admin;
    _room = room;
}

  Messages.fromJson(dynamic json) {
    _id = json['id'];
    _crId = json['cr_id'];
    _userId = json['user_id'];
    _message = json['message'];
    _image = json['image'];
    _messageType = json['message_type'];
    _userType = json['user_type'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _fileUrl = json['file_url'];
    _admin = json['admin'];
    _room = json['room'] != null ? Room.fromJson(json['room']) : null;
  }
  num? _id;
  num? _crId;
  num? _userId;
  String? _message;
  String? _image;
  String? _messageType;
  String? _userType;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  User? _user;
  String? _fileUrl;
  dynamic _admin;
  Room? _room;
Messages copyWith({  num? id,
  num? crId,
  num? userId,
  String? message,
  String? image,
  String? messageType,
  String? userType,
  num? status,
  String? createdAt,
  String? updatedAt,
  User? user,
  String? fileUrl,
  dynamic admin,
  Room? room,
}) => Messages(  id: id ?? _id,
  crId: crId ?? _crId,
  userId: userId ?? _userId,
  message: message ?? _message,
  image: image ?? _image,
  messageType: messageType ?? _messageType,
  userType: userType ?? _userType,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  user: user ?? _user,
  fileUrl: fileUrl ?? _fileUrl,
  admin: admin ?? _admin,
  room: room ?? _room,
);
  num? get id => _id;
  num? get crId => _crId;
  num? get userId => _userId;
  String? get message => _message;
  String? get image => _image;
  String? get messageType => _messageType;
  String? get userType => _userType;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  User? get user => _user;
  String? get fileUrl => _fileUrl;
  dynamic get admin => _admin;
  Room? get room => _room;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['cr_id'] = _crId;
    map['user_id'] = _userId;
    map['message'] = _message;
    map['image'] = _image;
    map['message_type'] = _messageType;
    map['user_type'] = _userType;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['file_url'] = _fileUrl;
    map['admin'] = _admin;
    if (_room != null) {
      map['room'] = _room?.toJson();
    }
    return map;
  }

}

/// id : 17
/// user_one_id : 182
/// user_two_id : 1
/// admin_id : 0
/// status : 1
/// created_at : "2023-09-13T13:50:00.000000Z"
/// updated_at : "2023-09-13T13:50:00.000000Z"
/// userone : {"id":182,"name":"createlistdealr1","mobile":"2222222222","email":"ddddd@gmail.com","city":"Madurai","state":"Tamil Nadu","profession_id":0,"customer_id":"cust_MawHqBbZMCpEla","photo":"photo_65167.jpg","about":"Ghjjk","referal_code":"TlyaIr7hMB","email_verified_at":null,"mobile_verified_at":null,"auth_token":"a4ee88179df9c6588485eca28991b739","fcm_tokan":null,"facebook_id":"","google_id":"","role_id":2,"featured":0,"status":2,"active":"online","created_at":"2023-09-11T07:02:20.000000Z","updated_at":"2023-10-11T05:08:32.000000Z","role_name":"Brokers","profession_name":"","photo_url":"http://sauda.wipspace.in/storage/profile_photo/photo_65167.jpg","id_proof":[{"id":144,"user_id":182,"proof_name":"id_proof","name":"Aadhar","path":"id_proof_725.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/id_proof_725.jpg"},{"id":145,"user_id":182,"proof_name":"company_proof","name":"Company ownership","path":"company_proof_79365.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/company_proof_79365.jpg"},{"id":146,"user_id":182,"proof_name":"pan_card","name":"Pan Card","path":"pan_card_11147.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/pan_card_11147.jpg"},{"id":147,"user_id":182,"proof_name":"recognitions_photo","name":"Recognitions","path":"recognitions_photo_38443.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/recognitions_photo_38443.jpg"},{"id":148,"user_id":182,"proof_name":"cancelled_cheque","name":"Cancelled Cheque","path":"cancelled_cheque_47023.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/cancelled_cheque_47023.jpg"},{"id":149,"user_id":182,"proof_name":"client_master","name":"Client Master","path":"company_proof_78997.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/company_proof_78997.jpg"},{"id":150,"user_id":182,"proof_name":"sebi_registration_certificate","name":"SEBI Registration Certificate","path":"sebi_registration_certificate_52402.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/sebi_registration_certificate_52402.jpg"},{"id":172,"user_id":182,"proof_name":"id_proof","name":"Aadhar","path":"id_proof_59477.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/id_proof_59477.jpg"},{"id":173,"user_id":182,"proof_name":"company_proof","name":"Company ownership","path":"company_proof_83378.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/company_proof_83378.jpg"},{"id":174,"user_id":182,"proof_name":"pan_card","name":"Pan Card","path":"pan_card_90141.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/pan_card_90141.jpg"},{"id":175,"user_id":182,"proof_name":"recognitions_photo","name":"Recognitions","path":"recognitions_photo_85817.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/recognitions_photo_85817.jpg"},{"id":176,"user_id":182,"proof_name":"cancelled_cheque","name":"Cancelled Cheque","path":"cancelled_cheque_32036.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/cancelled_cheque_32036.jpg"},{"id":177,"user_id":182,"proof_name":"sebi_registration_certificate","name":"SEBI Registration Certificate","path":"sebi_registration_certificate_99320.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/sebi_registration_certificate_99320.jpg"}],"user_meta_data":[{"id":385,"user_id":182,"key":"father_name","value":"Tesfather","status":1,"created_at":"2023-09-29T05:19:15.000000Z","updated_at":"2023-09-29T06:52:05.000000Z"},{"id":386,"user_id":182,"key":"date_of_birth","value":"9/29/2023","status":1,"created_at":"2023-09-29T05:19:15.000000Z","updated_at":"2023-09-29T06:52:05.000000Z"},{"id":387,"user_id":182,"key":"gender","value":"Male","status":1,"created_at":"2023-09-29T05:19:15.000000Z","updated_at":"2023-09-29T06:52:05.000000Z"},{"id":388,"user_id":182,"key":"age","value":"28","status":1,"created_at":"2023-09-29T05:19:15.000000Z","updated_at":"2023-09-29T06:52:05.000000Z"},{"id":389,"user_id":182,"key":"residential","value":"Foreign Nation","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":390,"user_id":182,"key":"pan_number","value":"123456565656","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":391,"user_id":182,"key":"current_address","value":"abservetech","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":392,"user_id":182,"key":"permanent_address","value":"abservetech","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":393,"user_id":182,"key":"service_year","value":"2 Years","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":394,"user_id":182,"key":"expertise","value":"fjfjfjf","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":395,"user_id":182,"key":"volume_deals_done","value":"test1test2test3","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z"},{"id":396,"user_id":182,"key":"name_depository","value":"test4","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":397,"user_id":182,"key":"depository_participant_dp_id","value":"test5","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":398,"user_id":182,"key":"depository","value":"test6","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":399,"user_id":182,"key":"depository_client_dp_id","value":"test7","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":459,"user_id":182,"key":"volume","value":"ddfgdfgdg","status":1,"created_at":"2023-10-03T10:40:23.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":460,"user_id":182,"key":"deals","value":"rert","status":1,"created_at":"2023-10-03T10:40:23.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":461,"user_id":182,"key":"done","value":"ertet","status":1,"created_at":"2023-10-03T10:40:23.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":462,"user_id":182,"key":"residential","value":"Foreign Nation","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":463,"user_id":182,"key":"pan_number","value":"123456565656","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":464,"user_id":182,"key":"current_address","value":"abservetech","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":465,"user_id":182,"key":"permanent_address","value":"abservetech","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":466,"user_id":182,"key":"service_year","value":"2 Years","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":467,"user_id":182,"key":"expertise","value":"fjfjfjf","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":468,"user_id":182,"key":"name_depository","value":"test4","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":469,"user_id":182,"key":"depository_participant_dp_id","value":"test5","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":470,"user_id":182,"key":"depository","value":"test6","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":471,"user_id":182,"key":"depository_client_dp_id","value":"test7","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"}],"user_profession":[{"id":229,"user_id":182,"profession_id":62,"status":1,"created_at":"2023-09-29T06:52:05.000000Z","updated_at":"2023-09-29T06:52:05.000000Z","profession":{"id":62,"name":"Teacher","status":1,"created_at":"2022-09-27T15:00:00.000000Z","updated_at":"2022-09-27T15:00:00.000000Z"}}]}
/// usertwo : {"id":1,"name":"Boopathi","mobile":"8760083370","email":"boopathi@yahoo.com","city":"Beri Khas","state":"Haryana","profession_id":1,"customer_id":"cust_MYc4ZYYGHNTyuz","photo":"photo_58061.jpg","about":"Twstijjsu","referal_code":"cPhRaw4E","email_verified_at":"2022-09-28T06:08:00.000000Z","mobile_verified_at":"2022-09-28T06:08:00.000000Z","auth_token":"ecb53432cbb743a2e847a6014d1e725b","fcm_tokan":null,"facebook_id":"1234567890","google_id":"","role_id":1,"featured":0,"status":1,"active":"online","created_at":"2022-09-27T15:00:00.000000Z","updated_at":"2023-10-10T08:02:20.000000Z","role_name":"Users","profession_name":"Accountant","photo_url":"http://sauda.wipspace.in/storage/profile_photo/photo_58061.jpg","id_proof":[{"id":53,"user_id":1,"proof_name":"id_proof","name":"Aadhar Card","path":"back-arrow_17248.png","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/back-arrow_17248.png"},{"id":54,"user_id":1,"proof_name":"company_proof","name":"Company ownership","path":"filter_41070.png","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/filter_41070.png"},{"id":55,"user_id":1,"proof_name":"pan_card","name":"Pan Card","path":"unlistbg_62973.png","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/unlistbg_62973.png"},{"id":56,"user_id":1,"proof_name":"recognitions_photo","name":"Recognitions","path":"unlistbg_71050.png","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/unlistbg_71050.png"},{"id":57,"user_id":1,"proof_name":"cancelled_cheque","name":"Cancelled Cheque","path":"edit_9157.png","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/edit_9157.png"},{"id":58,"user_id":1,"proof_name":"client_master","name":"Client Master","path":"mobile_43491.png","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/mobile_43491.png"},{"id":59,"user_id":1,"proof_name":"id_proof","name":"Aadhar Card","path":"back-arrow_43190.png","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/back-arrow_43190.png"},{"id":60,"user_id":1,"proof_name":"pan_card","name":"Pan Card","path":"unlistbg_63667.png","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/unlistbg_63667.png"},{"id":61,"user_id":1,"proof_name":"recognitions_photo","name":"Recognitions","path":"unlistbg_81880.png","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/unlistbg_81880.png"},{"id":62,"user_id":1,"proof_name":"cancelled_cheque","name":"Cancelled Cheque","path":"edit_64387.png","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/edit_64387.png"},{"id":63,"user_id":1,"proof_name":"client_master","name":"Client Master","path":"mobile_59162.png","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/mobile_59162.png"}],"user_meta_data":[{"id":17,"user_id":1,"key":"residential","value":"Resident Individual","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z"},{"id":18,"user_id":1,"key":"pan_number","value":"12345678","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z"},{"id":19,"user_id":1,"key":"current_address","value":"coimbatore","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z"},{"id":20,"user_id":1,"key":"permanent_address","value":"erode","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z"},{"id":21,"user_id":1,"key":"service_year","value":"30","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z"},{"id":22,"user_id":1,"key":"residential","value":"Resident Individual","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z"},{"id":23,"user_id":1,"key":"pan_number","value":"12345678","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z"},{"id":24,"user_id":1,"key":"current_address","value":"coimbatore","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z"},{"id":25,"user_id":1,"key":"permanent_address","value":"erode","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z"},{"id":32,"user_id":1,"key":"father_name","value":"Testing","status":1,"created_at":"2023-09-05T09:59:07.000000Z","updated_at":"2023-09-28T15:15:58.000000Z"},{"id":33,"user_id":1,"key":"date_of_birth","value":"9/28/2023","status":1,"created_at":"2023-09-05T09:59:07.000000Z","updated_at":"2023-09-28T15:15:58.000000Z"},{"id":34,"user_id":1,"key":"gender","value":"Male","status":1,"created_at":"2023-09-05T09:59:07.000000Z","updated_at":"2023-09-28T15:15:58.000000Z"},{"id":384,"user_id":1,"key":"age","value":"28","status":1,"created_at":"2023-09-28T15:15:09.000000Z","updated_at":"2023-09-28T15:15:58.000000Z"}],"user_profession":[{"id":226,"user_id":1,"profession_id":1,"status":1,"created_at":"2023-09-28T15:15:58.000000Z","updated_at":"2023-09-28T15:15:58.000000Z","profession":{"id":1,"name":"Accountant","status":1,"created_at":"2022-09-27T15:00:00.000000Z","updated_at":"2022-09-27T15:00:00.000000Z"}}]}
/// admin : false

class Room {
  Room({
      num? id, 
      num? userOneId, 
      num? userTwoId, 
      num? adminId, 
      num? status, 
      String? createdAt, 
      String? updatedAt, 
      Userone? userone, 
      Usertwo? usertwo, 
      dynamic? admin,}){
    _id = id;
    _userOneId = userOneId;
    _userTwoId = userTwoId;
    _adminId = adminId;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _userone = userone;
    _usertwo = usertwo;
    _admin = admin;
}

  Room.fromJson(dynamic json) {
    _id = json['id'];
    _userOneId = json['user_one_id'];
    _userTwoId = json['user_two_id'];
    _adminId = json['admin_id'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _userone = json['userone'] != null ? Userone.fromJson(json['userone']) : null;
    _usertwo = json['usertwo'] != null ? Usertwo.fromJson(json['usertwo']) : null;
    _admin = json['admin'];
  }
  num? _id;
  num? _userOneId;
  num? _userTwoId;
  num? _adminId;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  Userone? _userone;
  Usertwo? _usertwo;
  dynamic? _admin;
Room copyWith({  num? id,
  num? userOneId,
  num? userTwoId,
  num? adminId,
  num? status,
  String? createdAt,
  String? updatedAt,
  Userone? userone,
  Usertwo? usertwo,
  dynamic? admin,
}) => Room(  id: id ?? _id,
  userOneId: userOneId ?? _userOneId,
  userTwoId: userTwoId ?? _userTwoId,
  adminId: adminId ?? _adminId,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  userone: userone ?? _userone,
  usertwo: usertwo ?? _usertwo,
  admin: admin ?? _admin,
);
  num? get id => _id;
  num? get userOneId => _userOneId;
  num? get userTwoId => _userTwoId;
  num? get adminId => _adminId;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Userone? get userone => _userone;
  Usertwo? get usertwo => _usertwo;
  dynamic? get admin => _admin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_one_id'] = _userOneId;
    map['user_two_id'] = _userTwoId;
    map['admin_id'] = _adminId;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_userone != null) {
      map['userone'] = _userone?.toJson();
    }
    if (_usertwo != null) {
      map['usertwo'] = _usertwo?.toJson();
    }
    map['admin'] = _admin;
    return map;
  }

}

/// id : 1
/// name : "Boopathi"
/// mobile : "8760083370"
/// email : "boopathi@yahoo.com"
/// city : "Beri Khas"
/// state : "Haryana"
/// profession_id : 1
/// customer_id : "cust_MYc4ZYYGHNTyuz"
/// photo : "photo_58061.jpg"
/// about : "Twstijjsu"
/// referal_code : "cPhRaw4E"
/// email_verified_at : "2022-09-28T06:08:00.000000Z"
/// mobile_verified_at : "2022-09-28T06:08:00.000000Z"
/// auth_token : "ecb53432cbb743a2e847a6014d1e725b"
/// fcm_tokan : null
/// facebook_id : "1234567890"
/// google_id : ""
/// role_id : 1
/// featured : 0
/// status : 1
/// active : "online"
/// created_at : "2022-09-27T15:00:00.000000Z"
/// updated_at : "2023-10-10T08:02:20.000000Z"
/// role_name : "Users"
/// profession_name : "Accountant"
/// photo_url : "http://sauda.wipspace.in/storage/profile_photo/photo_58061.jpg"
/// id_proof : [{"id":53,"user_id":1,"proof_name":"id_proof","name":"Aadhar Card","path":"back-arrow_17248.png","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/back-arrow_17248.png"},{"id":54,"user_id":1,"proof_name":"company_proof","name":"Company ownership","path":"filter_41070.png","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/filter_41070.png"},{"id":55,"user_id":1,"proof_name":"pan_card","name":"Pan Card","path":"unlistbg_62973.png","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/unlistbg_62973.png"},{"id":56,"user_id":1,"proof_name":"recognitions_photo","name":"Recognitions","path":"unlistbg_71050.png","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/unlistbg_71050.png"},{"id":57,"user_id":1,"proof_name":"cancelled_cheque","name":"Cancelled Cheque","path":"edit_9157.png","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/edit_9157.png"},{"id":58,"user_id":1,"proof_name":"client_master","name":"Client Master","path":"mobile_43491.png","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/mobile_43491.png"},{"id":59,"user_id":1,"proof_name":"id_proof","name":"Aadhar Card","path":"back-arrow_43190.png","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/back-arrow_43190.png"},{"id":60,"user_id":1,"proof_name":"pan_card","name":"Pan Card","path":"unlistbg_63667.png","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/unlistbg_63667.png"},{"id":61,"user_id":1,"proof_name":"recognitions_photo","name":"Recognitions","path":"unlistbg_81880.png","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/unlistbg_81880.png"},{"id":62,"user_id":1,"proof_name":"cancelled_cheque","name":"Cancelled Cheque","path":"edit_64387.png","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/edit_64387.png"},{"id":63,"user_id":1,"proof_name":"client_master","name":"Client Master","path":"mobile_59162.png","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/mobile_59162.png"}]
/// user_meta_data : [{"id":17,"user_id":1,"key":"residential","value":"Resident Individual","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z"},{"id":18,"user_id":1,"key":"pan_number","value":"12345678","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z"},{"id":19,"user_id":1,"key":"current_address","value":"coimbatore","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z"},{"id":20,"user_id":1,"key":"permanent_address","value":"erode","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z"},{"id":21,"user_id":1,"key":"service_year","value":"30","status":1,"created_at":"2023-09-04T13:35:27.000000Z","updated_at":"2023-09-04T13:35:27.000000Z"},{"id":22,"user_id":1,"key":"residential","value":"Resident Individual","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z"},{"id":23,"user_id":1,"key":"pan_number","value":"12345678","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z"},{"id":24,"user_id":1,"key":"current_address","value":"coimbatore","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z"},{"id":25,"user_id":1,"key":"permanent_address","value":"erode","status":1,"created_at":"2023-09-04T13:42:34.000000Z","updated_at":"2023-09-04T13:42:34.000000Z"},{"id":32,"user_id":1,"key":"father_name","value":"Testing","status":1,"created_at":"2023-09-05T09:59:07.000000Z","updated_at":"2023-09-28T15:15:58.000000Z"},{"id":33,"user_id":1,"key":"date_of_birth","value":"9/28/2023","status":1,"created_at":"2023-09-05T09:59:07.000000Z","updated_at":"2023-09-28T15:15:58.000000Z"},{"id":34,"user_id":1,"key":"gender","value":"Male","status":1,"created_at":"2023-09-05T09:59:07.000000Z","updated_at":"2023-09-28T15:15:58.000000Z"},{"id":384,"user_id":1,"key":"age","value":"28","status":1,"created_at":"2023-09-28T15:15:09.000000Z","updated_at":"2023-09-28T15:15:58.000000Z"}]
/// user_profession : [{"id":226,"user_id":1,"profession_id":1,"status":1,"created_at":"2023-09-28T15:15:58.000000Z","updated_at":"2023-09-28T15:15:58.000000Z","profession":{"id":1,"name":"Accountant","status":1,"created_at":"2022-09-27T15:00:00.000000Z","updated_at":"2022-09-27T15:00:00.000000Z"}}]


/// id : 226
/// user_id : 1
/// profession_id : 1
/// status : 1
/// created_at : "2023-09-28T15:15:58.000000Z"
/// updated_at : "2023-09-28T15:15:58.000000Z"
/// profession : {"id":1,"name":"Accountant","status":1,"created_at":"2022-09-27T15:00:00.000000Z","updated_at":"2022-09-27T15:00:00.000000Z"}



/// id : 1
/// name : "Accountant"
/// status : 1
/// created_at : "2022-09-27T15:00:00.000000Z"
/// updated_at : "2022-09-27T15:00:00.000000Z"

class Profession {
  Profession({
      num? id, 
      String? name, 
      num? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Profession.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
Profession copyWith({  num? id,
  String? name,
  num? status,
  String? createdAt,
  String? updatedAt,
}) => Profession(  id: id ?? _id,
  name: name ?? _name,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 17
/// user_id : 1
/// key : "residential"
/// value : "Resident Individual"
/// status : 1
/// created_at : "2023-09-04T13:35:27.000000Z"
/// updated_at : "2023-09-04T13:35:27.000000Z"

class UserMetaData {
  UserMetaData({
      num? id, 
      num? userId, 
      String? key, 
      String? value, 
      num? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _key = key;
    _value = value;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  UserMetaData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _key = json['key'];
    _value = json['value'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  String? _key;
  String? _value;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
UserMetaData copyWith({  num? id,
  num? userId,
  String? key,
  String? value,
  num? status,
  String? createdAt,
  String? updatedAt,
}) => UserMetaData(  id: id ?? _id,
  userId: userId ?? _userId,
  key: key ?? _key,
  value: value ?? _value,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get key => _key;
  String? get value => _value;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['key'] = _key;
    map['value'] = _value;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 53
/// user_id : 1
/// proof_name : "id_proof"
/// name : "Aadhar Card"
/// path : "back-arrow_17248.png"
/// status : 1
/// created_at : "2023-09-04T13:35:27.000000Z"
/// updated_at : "2023-09-04T13:35:27.000000Z"
/// proof_url : "http://sauda.wipspace.in/storage/id_proof/back-arrow_17248.png"

class IdProof {
  IdProof({
      num? id, 
      num? userId, 
      String? proofName, 
      String? name, 
      String? path, 
      num? status, 
      String? createdAt, 
      String? updatedAt, 
      String? proofUrl,}){
    _id = id;
    _userId = userId;
    _proofName = proofName;
    _name = name;
    _path = path;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _proofUrl = proofUrl;
}

  IdProof.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _proofName = json['proof_name'];
    _name = json['name'];
    _path = json['path'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _proofUrl = json['proof_url'];
  }
  num? _id;
  num? _userId;
  String? _proofName;
  String? _name;
  String? _path;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _proofUrl;
IdProof copyWith({  num? id,
  num? userId,
  String? proofName,
  String? name,
  String? path,
  num? status,
  String? createdAt,
  String? updatedAt,
  String? proofUrl,
}) => IdProof(  id: id ?? _id,
  userId: userId ?? _userId,
  proofName: proofName ?? _proofName,
  name: name ?? _name,
  path: path ?? _path,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  proofUrl: proofUrl ?? _proofUrl,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get proofName => _proofName;
  String? get name => _name;
  String? get path => _path;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get proofUrl => _proofUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['proof_name'] = _proofName;
    map['name'] = _name;
    map['path'] = _path;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['proof_url'] = _proofUrl;
    return map;
  }

}

/// id : 182
/// name : "createlistdealr1"
/// mobile : "2222222222"
/// email : "ddddd@gmail.com"
/// city : "Madurai"
/// state : "Tamil Nadu"
/// profession_id : 0
/// customer_id : "cust_MawHqBbZMCpEla"
/// photo : "photo_65167.jpg"
/// about : "Ghjjk"
/// referal_code : "TlyaIr7hMB"
/// email_verified_at : null
/// mobile_verified_at : null
/// auth_token : "a4ee88179df9c6588485eca28991b739"
/// fcm_tokan : null
/// facebook_id : ""
/// google_id : ""
/// role_id : 2
/// featured : 0
/// status : 2
/// active : "online"
/// created_at : "2023-09-11T07:02:20.000000Z"
/// updated_at : "2023-10-11T05:08:32.000000Z"
/// role_name : "Brokers"
/// profession_name : ""
/// photo_url : "http://sauda.wipspace.in/storage/profile_photo/photo_65167.jpg"
/// id_proof : [{"id":144,"user_id":182,"proof_name":"id_proof","name":"Aadhar","path":"id_proof_725.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/id_proof_725.jpg"},{"id":145,"user_id":182,"proof_name":"company_proof","name":"Company ownership","path":"company_proof_79365.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/company_proof_79365.jpg"},{"id":146,"user_id":182,"proof_name":"pan_card","name":"Pan Card","path":"pan_card_11147.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/pan_card_11147.jpg"},{"id":147,"user_id":182,"proof_name":"recognitions_photo","name":"Recognitions","path":"recognitions_photo_38443.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/recognitions_photo_38443.jpg"},{"id":148,"user_id":182,"proof_name":"cancelled_cheque","name":"Cancelled Cheque","path":"cancelled_cheque_47023.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/cancelled_cheque_47023.jpg"},{"id":149,"user_id":182,"proof_name":"client_master","name":"Client Master","path":"company_proof_78997.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/company_proof_78997.jpg"},{"id":150,"user_id":182,"proof_name":"sebi_registration_certificate","name":"SEBI Registration Certificate","path":"sebi_registration_certificate_52402.jpg","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/sebi_registration_certificate_52402.jpg"},{"id":172,"user_id":182,"proof_name":"id_proof","name":"Aadhar","path":"id_proof_59477.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/id_proof_59477.jpg"},{"id":173,"user_id":182,"proof_name":"company_proof","name":"Company ownership","path":"company_proof_83378.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/company_proof_83378.jpg"},{"id":174,"user_id":182,"proof_name":"pan_card","name":"Pan Card","path":"pan_card_90141.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/pan_card_90141.jpg"},{"id":175,"user_id":182,"proof_name":"recognitions_photo","name":"Recognitions","path":"recognitions_photo_85817.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/recognitions_photo_85817.jpg"},{"id":176,"user_id":182,"proof_name":"cancelled_cheque","name":"Cancelled Cheque","path":"cancelled_cheque_32036.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/cancelled_cheque_32036.jpg"},{"id":177,"user_id":182,"proof_name":"sebi_registration_certificate","name":"SEBI Registration Certificate","path":"sebi_registration_certificate_99320.jpg","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-03T10:47:05.000000Z","proof_url":"http://sauda.wipspace.in/storage/id_proof/sebi_registration_certificate_99320.jpg"}]
/// user_meta_data : [{"id":385,"user_id":182,"key":"father_name","value":"Tesfather","status":1,"created_at":"2023-09-29T05:19:15.000000Z","updated_at":"2023-09-29T06:52:05.000000Z"},{"id":386,"user_id":182,"key":"date_of_birth","value":"9/29/2023","status":1,"created_at":"2023-09-29T05:19:15.000000Z","updated_at":"2023-09-29T06:52:05.000000Z"},{"id":387,"user_id":182,"key":"gender","value":"Male","status":1,"created_at":"2023-09-29T05:19:15.000000Z","updated_at":"2023-09-29T06:52:05.000000Z"},{"id":388,"user_id":182,"key":"age","value":"28","status":1,"created_at":"2023-09-29T05:19:15.000000Z","updated_at":"2023-09-29T06:52:05.000000Z"},{"id":389,"user_id":182,"key":"residential","value":"Foreign Nation","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":390,"user_id":182,"key":"pan_number","value":"123456565656","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":391,"user_id":182,"key":"current_address","value":"abservetech","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":392,"user_id":182,"key":"permanent_address","value":"abservetech","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":393,"user_id":182,"key":"service_year","value":"2 Years","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":394,"user_id":182,"key":"expertise","value":"fjfjfjf","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":395,"user_id":182,"key":"volume_deals_done","value":"test1test2test3","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-09-29T07:38:03.000000Z"},{"id":396,"user_id":182,"key":"name_depository","value":"test4","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":397,"user_id":182,"key":"depository_participant_dp_id","value":"test5","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":398,"user_id":182,"key":"depository","value":"test6","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":399,"user_id":182,"key":"depository_client_dp_id","value":"test7","status":1,"created_at":"2023-09-29T07:38:03.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":459,"user_id":182,"key":"volume","value":"ddfgdfgdg","status":1,"created_at":"2023-10-03T10:40:23.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":460,"user_id":182,"key":"deals","value":"rert","status":1,"created_at":"2023-10-03T10:40:23.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":461,"user_id":182,"key":"done","value":"ertet","status":1,"created_at":"2023-10-03T10:40:23.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":462,"user_id":182,"key":"residential","value":"Foreign Nation","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":463,"user_id":182,"key":"pan_number","value":"123456565656","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":464,"user_id":182,"key":"current_address","value":"abservetech","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":465,"user_id":182,"key":"permanent_address","value":"abservetech","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":466,"user_id":182,"key":"service_year","value":"2 Years","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":467,"user_id":182,"key":"expertise","value":"fjfjfjf","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":468,"user_id":182,"key":"name_depository","value":"test4","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":469,"user_id":182,"key":"depository_participant_dp_id","value":"test5","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":470,"user_id":182,"key":"depository","value":"test6","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"},{"id":471,"user_id":182,"key":"depository_client_dp_id","value":"test7","status":1,"created_at":"2023-10-03T10:47:05.000000Z","updated_at":"2023-10-04T05:59:24.000000Z"}]
/// user_profession : [{"id":229,"user_id":182,"profession_id":62,"status":1,"created_at":"2023-09-29T06:52:05.000000Z","updated_at":"2023-09-29T06:52:05.000000Z","profession":{"id":62,"name":"Teacher","status":1,"created_at":"2022-09-27T15:00:00.000000Z","updated_at":"2022-09-27T15:00:00.000000Z"}}]



/// id : 229
/// user_id : 182
/// profession_id : 62
/// status : 1
/// created_at : "2023-09-29T06:52:05.000000Z"
/// updated_at : "2023-09-29T06:52:05.000000Z"
/// profession : {"id":62,"name":"Teacher","status":1,"created_at":"2022-09-27T15:00:00.000000Z","updated_at":"2022-09-27T15:00:00.000000Z"}

class UserProfession {
  UserProfession({
      num? id, 
      num? userId, 
      num? professionId, 
      num? status, 
      String? createdAt, 
      String? updatedAt, 
      Profession? profession,}){
    _id = id;
    _userId = userId;
    _professionId = professionId;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _profession = profession;
}

  UserProfession.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _professionId = json['profession_id'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _profession = json['profession'] != null ? Profession.fromJson(json['profession']) : null;
  }
  num? _id;
  num? _userId;
  num? _professionId;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  Profession? _profession;
UserProfession copyWith({  num? id,
  num? userId,
  num? professionId,
  num? status,
  String? createdAt,
  String? updatedAt,
  Profession? profession,
}) => UserProfession(  id: id ?? _id,
  userId: userId ?? _userId,
  professionId: professionId ?? _professionId,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  profession: profession ?? _profession,
);
  num? get id => _id;
  num? get userId => _userId;
  num? get professionId => _professionId;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Profession? get profession => _profession;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['profession_id'] = _professionId;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_profession != null) {
      map['profession'] = _profession?.toJson();
    }
    return map;
  }

}

class User {
  User({
      num? id, 
      String? name, 
      String? mobile, 
      String? email, 
      String? city, 
      String? state, 
      num? professionId, 
      String? customerId, 
      String? photo, 
      String? about, 
      String? referalCode, 
      dynamic emailVerifiedAt, 
      dynamic mobileVerifiedAt, 
      String? authToken, 
      dynamic fcmTokan, 
      String? facebookId, 
      String? googleId, 
      num? roleId, 
      num? featured, 
      num? status, 
      String? active, 
      String? createdAt, 
      String? updatedAt, 
      String? roleName, 
      String? professionName, 
      String? photoUrl, 
      List<IdProof>? idProof, 
      List<UserMetaData>? userMetaData, 
      List<UserProfession>? userProfession,}){
    _id = id;
    _name = name;
    _mobile = mobile;
    _email = email;
    _city = city;
    _state = state;
    _professionId = professionId;
    _customerId = customerId;
    _photo = photo;
    _about = about;
    _referalCode = referalCode;
    _emailVerifiedAt = emailVerifiedAt;
    _mobileVerifiedAt = mobileVerifiedAt;
    _authToken = authToken;
    _fcmTokan = fcmTokan;
    _facebookId = facebookId;
    _googleId = googleId;
    _roleId = roleId;
    _featured = featured;
    _status = status;
    _active = active;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _roleName = roleName;
    _professionName = professionName;
    _photoUrl = photoUrl;
    _idProof = idProof;
    _userMetaData = userMetaData;
    _userProfession = userProfession;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _mobile = json['mobile'];
    _email = json['email'];
    _city = json['city'];
    _state = json['state'];
    _professionId = json['profession_id'];
    _customerId = json['customer_id'];
    _photo = json['photo'];
    _about = json['about'];
    _referalCode = json['referal_code'];
    _emailVerifiedAt = json['email_verified_at'];
    _mobileVerifiedAt = json['mobile_verified_at'];
    _authToken = json['auth_token'];
    _fcmTokan = json['fcm_tokan'];
    _facebookId = json['facebook_id'];
    _googleId = json['google_id'];
    _roleId = json['role_id'];
    _featured = json['featured'];
    _status = json['status'];
    _active = json['active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _roleName = json['role_name'];
    _professionName = json['profession_name'];
    _photoUrl = json['photo_url'];
    if (json['id_proof'] != null) {
      _idProof = [];
      json['id_proof'].forEach((v) {
        _idProof?.add(IdProof.fromJson(v));
      });
    }
    if (json['user_meta_data'] != null) {
      _userMetaData = [];
      json['user_meta_data'].forEach((v) {
        _userMetaData?.add(UserMetaData.fromJson(v));
      });
    }
    if (json['user_profession'] != null) {
      _userProfession = [];
      json['user_profession'].forEach((v) {
        _userProfession?.add(UserProfession.fromJson(v));
      });
    }
  }
  num? _id;
  String? _name;
  String? _mobile;
  String? _email;
  String? _city;
  String? _state;
  num? _professionId;
  String? _customerId;
  String? _photo;
  String? _about;
  String? _referalCode;
  dynamic _emailVerifiedAt;
  dynamic _mobileVerifiedAt;
  String? _authToken;
  dynamic _fcmTokan;
  String? _facebookId;
  String? _googleId;
  num? _roleId;
  num? _featured;
  num? _status;
  String? _active;
  String? _createdAt;
  String? _updatedAt;
  String? _roleName;
  String? _professionName;
  String? _photoUrl;
  List<IdProof>? _idProof;
  List<UserMetaData>? _userMetaData;
  List<UserProfession>? _userProfession;
User copyWith({  num? id,
  String? name,
  String? mobile,
  String? email,
  String? city,
  String? state,
  num? professionId,
  String? customerId,
  String? photo,
  String? about,
  String? referalCode,
  dynamic emailVerifiedAt,
  dynamic mobileVerifiedAt,
  String? authToken,
  dynamic fcmTokan,
  String? facebookId,
  String? googleId,
  num? roleId,
  num? featured,
  num? status,
  String? active,
  String? createdAt,
  String? updatedAt,
  String? roleName,
  String? professionName,
  String? photoUrl,
  List<IdProof>? idProof,
  List<UserMetaData>? userMetaData,
  List<UserProfession>? userProfession,
}) => User(  id: id ?? _id,
  name: name ?? _name,
  mobile: mobile ?? _mobile,
  email: email ?? _email,
  city: city ?? _city,
  state: state ?? _state,
  professionId: professionId ?? _professionId,
  customerId: customerId ?? _customerId,
  photo: photo ?? _photo,
  about: about ?? _about,
  referalCode: referalCode ?? _referalCode,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  mobileVerifiedAt: mobileVerifiedAt ?? _mobileVerifiedAt,
  authToken: authToken ?? _authToken,
  fcmTokan: fcmTokan ?? _fcmTokan,
  facebookId: facebookId ?? _facebookId,
  googleId: googleId ?? _googleId,
  roleId: roleId ?? _roleId,
  featured: featured ?? _featured,
  status: status ?? _status,
  active: active ?? _active,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  roleName: roleName ?? _roleName,
  professionName: professionName ?? _professionName,
  photoUrl: photoUrl ?? _photoUrl,
  idProof: idProof ?? _idProof,
  userMetaData: userMetaData ?? _userMetaData,
  userProfession: userProfession ?? _userProfession,
);
  num? get id => _id;
  String? get name => _name;
  String? get mobile => _mobile;
  String? get email => _email;
  String? get city => _city;
  String? get state => _state;
  num? get professionId => _professionId;
  String? get customerId => _customerId;
  String? get photo => _photo;
  String? get about => _about;
  String? get referalCode => _referalCode;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  dynamic get mobileVerifiedAt => _mobileVerifiedAt;
  String? get authToken => _authToken;
  dynamic get fcmTokan => _fcmTokan;
  String? get facebookId => _facebookId;
  String? get googleId => _googleId;
  num? get roleId => _roleId;
  num? get featured => _featured;
  num? get status => _status;
  String? get active => _active;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get roleName => _roleName;
  String? get professionName => _professionName;
  String? get photoUrl => _photoUrl;
  List<IdProof>? get idProof => _idProof;
  List<UserMetaData>? get userMetaData => _userMetaData;
  List<UserProfession>? get userProfession => _userProfession;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['city'] = _city;
    map['state'] = _state;
    map['profession_id'] = _professionId;
    map['customer_id'] = _customerId;
    map['photo'] = _photo;
    map['about'] = _about;
    map['referal_code'] = _referalCode;
    map['email_verified_at'] = _emailVerifiedAt;
    map['mobile_verified_at'] = _mobileVerifiedAt;
    map['auth_token'] = _authToken;
    map['fcm_tokan'] = _fcmTokan;
    map['facebook_id'] = _facebookId;
    map['google_id'] = _googleId;
    map['role_id'] = _roleId;
    map['featured'] = _featured;
    map['status'] = _status;
    map['active'] = _active;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['role_name'] = _roleName;
    map['profession_name'] = _professionName;
    map['photo_url'] = _photoUrl;
    if (_idProof != null) {
      map['id_proof'] = _idProof?.map((v) => v.toJson()).toList();
    }
    if (_userMetaData != null) {
      map['user_meta_data'] = _userMetaData?.map((v) => v.toJson()).toList();
    }
    if (_userProfession != null) {
      map['user_profession'] = _userProfession?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Usertwo {
  Usertwo({
      num? id, 
      String? name, 
      String? mobile, 
      String? email, 
      String? city, 
      String? state, 
      num? professionId, 
      String? customerId, 
      String? photo, 
      String? about, 
      String? referalCode, 
      String? emailVerifiedAt, 
      String? mobileVerifiedAt, 
      String? authToken, 
      dynamic fcmTokan, 
      String? facebookId, 
      String? googleId, 
      num? roleId, 
      num? featured, 
      num? status, 
      String? active, 
      String? createdAt, 
      String? updatedAt, 
      String? roleName, 
      String? professionName, 
      String? photoUrl, 
      List<IdProof>? idProof, 
      List<UserMetaData>? userMetaData, 
      List<UserProfession>? userProfession,}){
    _id = id;
    _name = name;
    _mobile = mobile;
    _email = email;
    _city = city;
    _state = state;
    _professionId = professionId;
    _customerId = customerId;
    _photo = photo;
    _about = about;
    _referalCode = referalCode;
    _emailVerifiedAt = emailVerifiedAt;
    _mobileVerifiedAt = mobileVerifiedAt;
    _authToken = authToken;
    _fcmTokan = fcmTokan;
    _facebookId = facebookId;
    _googleId = googleId;
    _roleId = roleId;
    _featured = featured;
    _status = status;
    _active = active;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _roleName = roleName;
    _professionName = professionName;
    _photoUrl = photoUrl;
    _idProof = idProof;
    _userMetaData = userMetaData;
    _userProfession = userProfession;
}

  Usertwo.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _mobile = json['mobile'];
    _email = json['email'];
    _city = json['city'];
    _state = json['state'];
    _professionId = json['profession_id'];
    _customerId = json['customer_id'];
    _photo = json['photo'];
    _about = json['about'];
    _referalCode = json['referal_code'];
    _emailVerifiedAt = json['email_verified_at'];
    _mobileVerifiedAt = json['mobile_verified_at'];
    _authToken = json['auth_token'];
    _fcmTokan = json['fcm_tokan'];
    _facebookId = json['facebook_id'];
    _googleId = json['google_id'];
    _roleId = json['role_id'];
    _featured = json['featured'];
    _status = json['status'];
    _active = json['active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _roleName = json['role_name'];
    _professionName = json['profession_name'];
    _photoUrl = json['photo_url'];
    if (json['id_proof'] != null) {
      _idProof = [];
      json['id_proof'].forEach((v) {
        _idProof?.add(IdProof.fromJson(v));
      });
    }
    if (json['user_meta_data'] != null) {
      _userMetaData = [];
      json['user_meta_data'].forEach((v) {
        _userMetaData?.add(UserMetaData.fromJson(v));
      });
    }
    if (json['user_profession'] != null) {
      _userProfession = [];
      json['user_profession'].forEach((v) {
        _userProfession?.add(UserProfession.fromJson(v));
      });
    }
  }
  num? _id;
  String? _name;
  String? _mobile;
  String? _email;
  String? _city;
  String? _state;
  num? _professionId;
  String? _customerId;
  String? _photo;
  String? _about;
  String? _referalCode;
  String? _emailVerifiedAt;
  String? _mobileVerifiedAt;
  String? _authToken;
  dynamic _fcmTokan;
  String? _facebookId;
  String? _googleId;
  num? _roleId;
  num? _featured;
  num? _status;
  String? _active;
  String? _createdAt;
  String? _updatedAt;
  String? _roleName;
  String? _professionName;
  String? _photoUrl;
  List<IdProof>? _idProof;
  List<UserMetaData>? _userMetaData;
  List<UserProfession>? _userProfession;
Usertwo copyWith({  num? id,
  String? name,
  String? mobile,
  String? email,
  String? city,
  String? state,
  num? professionId,
  String? customerId,
  String? photo,
  String? about,
  String? referalCode,
  String? emailVerifiedAt,
  String? mobileVerifiedAt,
  String? authToken,
  dynamic fcmTokan,
  String? facebookId,
  String? googleId,
  num? roleId,
  num? featured,
  num? status,
  String? active,
  String? createdAt,
  String? updatedAt,
  String? roleName,
  String? professionName,
  String? photoUrl,
  List<IdProof>? idProof,
  List<UserMetaData>? userMetaData,
  List<UserProfession>? userProfession,
}) => Usertwo(  id: id ?? _id,
  name: name ?? _name,
  mobile: mobile ?? _mobile,
  email: email ?? _email,
  city: city ?? _city,
  state: state ?? _state,
  professionId: professionId ?? _professionId,
  customerId: customerId ?? _customerId,
  photo: photo ?? _photo,
  about: about ?? _about,
  referalCode: referalCode ?? _referalCode,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  mobileVerifiedAt: mobileVerifiedAt ?? _mobileVerifiedAt,
  authToken: authToken ?? _authToken,
  fcmTokan: fcmTokan ?? _fcmTokan,
  facebookId: facebookId ?? _facebookId,
  googleId: googleId ?? _googleId,
  roleId: roleId ?? _roleId,
  featured: featured ?? _featured,
  status: status ?? _status,
  active: active ?? _active,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  roleName: roleName ?? _roleName,
  professionName: professionName ?? _professionName,
  photoUrl: photoUrl ?? _photoUrl,
  idProof: idProof ?? _idProof,
  userMetaData: userMetaData ?? _userMetaData,
  userProfession: userProfession ?? _userProfession,
);
  num? get id => _id;
  String? get name => _name;
  String? get mobile => _mobile;
  String? get email => _email;
  String? get city => _city;
  String? get state => _state;
  num? get professionId => _professionId;
  String? get customerId => _customerId;
  String? get photo => _photo;
  String? get about => _about;
  String? get referalCode => _referalCode;
  String? get emailVerifiedAt => _emailVerifiedAt;
  String? get mobileVerifiedAt => _mobileVerifiedAt;
  String? get authToken => _authToken;
  dynamic get fcmTokan => _fcmTokan;
  String? get facebookId => _facebookId;
  String? get googleId => _googleId;
  num? get roleId => _roleId;
  num? get featured => _featured;
  num? get status => _status;
  String? get active => _active;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get roleName => _roleName;
  String? get professionName => _professionName;
  String? get photoUrl => _photoUrl;
  List<IdProof>? get idProof => _idProof;
  List<UserMetaData>? get userMetaData => _userMetaData;
  List<UserProfession>? get userProfession => _userProfession;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['city'] = _city;
    map['state'] = _state;
    map['profession_id'] = _professionId;
    map['customer_id'] = _customerId;
    map['photo'] = _photo;
    map['about'] = _about;
    map['referal_code'] = _referalCode;
    map['email_verified_at'] = _emailVerifiedAt;
    map['mobile_verified_at'] = _mobileVerifiedAt;
    map['auth_token'] = _authToken;
    map['fcm_tokan'] = _fcmTokan;
    map['facebook_id'] = _facebookId;
    map['google_id'] = _googleId;
    map['role_id'] = _roleId;
    map['featured'] = _featured;
    map['status'] = _status;
    map['active'] = _active;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['role_name'] = _roleName;
    map['profession_name'] = _professionName;
    map['photo_url'] = _photoUrl;
    if (_idProof != null) {
      map['id_proof'] = _idProof?.map((v) => v.toJson()).toList();
    }
    if (_userMetaData != null) {
      map['user_meta_data'] = _userMetaData?.map((v) => v.toJson()).toList();
    }
    if (_userProfession != null) {
      map['user_profession'] = _userProfession?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}



class Userone {
  Userone({
      num? id, 
      String? name, 
      String? mobile, 
      String? email, 
      String? city, 
      String? state, 
      num? professionId, 
      String? customerId, 
      String? photo, 
      String? about, 
      String? referalCode, 
      dynamic emailVerifiedAt, 
      dynamic mobileVerifiedAt, 
      String? authToken, 
      dynamic fcmTokan, 
      String? facebookId, 
      String? googleId, 
      num? roleId, 
      num? featured, 
      num? status, 
      String? active, 
      String? createdAt, 
      String? updatedAt, 
      String? roleName, 
      String? professionName, 
      String? photoUrl, 
      List<IdProof>? idProof, 
      List<UserMetaData>? userMetaData, 
      List<UserProfession>? userProfession,}){
    _id = id;
    _name = name;
    _mobile = mobile;
    _email = email;
    _city = city;
    _state = state;
    _professionId = professionId;
    _customerId = customerId;
    _photo = photo;
    _about = about;
    _referalCode = referalCode;
    _emailVerifiedAt = emailVerifiedAt;
    _mobileVerifiedAt = mobileVerifiedAt;
    _authToken = authToken;
    _fcmTokan = fcmTokan;
    _facebookId = facebookId;
    _googleId = googleId;
    _roleId = roleId;
    _featured = featured;
    _status = status;
    _active = active;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _roleName = roleName;
    _professionName = professionName;
    _photoUrl = photoUrl;
    _idProof = idProof;
    _userMetaData = userMetaData;
    _userProfession = userProfession;
}

  Userone.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _mobile = json['mobile'];
    _email = json['email'];
    _city = json['city'];
    _state = json['state'];
    _professionId = json['profession_id'];
    _customerId = json['customer_id'];
    _photo = json['photo'];
    _about = json['about'];
    _referalCode = json['referal_code'];
    _emailVerifiedAt = json['email_verified_at'];
    _mobileVerifiedAt = json['mobile_verified_at'];
    _authToken = json['auth_token'];
    _fcmTokan = json['fcm_tokan'];
    _facebookId = json['facebook_id'];
    _googleId = json['google_id'];
    _roleId = json['role_id'];
    _featured = json['featured'];
    _status = json['status'];
    _active = json['active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _roleName = json['role_name'];
    _professionName = json['profession_name'];
    _photoUrl = json['photo_url'];
    if (json['id_proof'] != null) {
      _idProof = [];
      json['id_proof'].forEach((v) {
        _idProof?.add(IdProof.fromJson(v));
      });
    }
    if (json['user_meta_data'] != null) {
      _userMetaData = [];
      json['user_meta_data'].forEach((v) {
        _userMetaData?.add(UserMetaData.fromJson(v));
      });
    }
    if (json['user_profession'] != null) {
      _userProfession = [];
      json['user_profession'].forEach((v) {
        _userProfession?.add(UserProfession.fromJson(v));
      });
    }
  }
  num? _id;
  String? _name;
  String? _mobile;
  String? _email;
  String? _city;
  String? _state;
  num? _professionId;
  String? _customerId;
  String? _photo;
  String? _about;
  String? _referalCode;
  dynamic _emailVerifiedAt;
  dynamic _mobileVerifiedAt;
  String? _authToken;
  dynamic _fcmTokan;
  String? _facebookId;
  String? _googleId;
  num? _roleId;
  num? _featured;
  num? _status;
  String? _active;
  String? _createdAt;
  String? _updatedAt;
  String? _roleName;
  String? _professionName;
  String? _photoUrl;
  List<IdProof>? _idProof;
  List<UserMetaData>? _userMetaData;
  List<UserProfession>? _userProfession;
Userone copyWith({  num? id,
  String? name,
  String? mobile,
  String? email,
  String? city,
  String? state,
  num? professionId,
  String? customerId,
  String? photo,
  String? about,
  String? referalCode,
  dynamic emailVerifiedAt,
  dynamic mobileVerifiedAt,
  String? authToken,
  dynamic fcmTokan,
  String? facebookId,
  String? googleId,
  num? roleId,
  num? featured,
  num? status,
  String? active,
  String? createdAt,
  String? updatedAt,
  String? roleName,
  String? professionName,
  String? photoUrl,
  List<IdProof>? idProof,
  List<UserMetaData>? userMetaData,
  List<UserProfession>? userProfession,
}) => Userone(  id: id ?? _id,
  name: name ?? _name,
  mobile: mobile ?? _mobile,
  email: email ?? _email,
  city: city ?? _city,
  state: state ?? _state,
  professionId: professionId ?? _professionId,
  customerId: customerId ?? _customerId,
  photo: photo ?? _photo,
  about: about ?? _about,
  referalCode: referalCode ?? _referalCode,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  mobileVerifiedAt: mobileVerifiedAt ?? _mobileVerifiedAt,
  authToken: authToken ?? _authToken,
  fcmTokan: fcmTokan ?? _fcmTokan,
  facebookId: facebookId ?? _facebookId,
  googleId: googleId ?? _googleId,
  roleId: roleId ?? _roleId,
  featured: featured ?? _featured,
  status: status ?? _status,
  active: active ?? _active,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  roleName: roleName ?? _roleName,
  professionName: professionName ?? _professionName,
  photoUrl: photoUrl ?? _photoUrl,
  idProof: idProof ?? _idProof,
  userMetaData: userMetaData ?? _userMetaData,
  userProfession: userProfession ?? _userProfession,
);
  num? get id => _id;
  String? get name => _name;
  String? get mobile => _mobile;
  String? get email => _email;
  String? get city => _city;
  String? get state => _state;
  num? get professionId => _professionId;
  String? get customerId => _customerId;
  String? get photo => _photo;
  String? get about => _about;
  String? get referalCode => _referalCode;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  dynamic get mobileVerifiedAt => _mobileVerifiedAt;
  String? get authToken => _authToken;
  dynamic get fcmTokan => _fcmTokan;
  String? get facebookId => _facebookId;
  String? get googleId => _googleId;
  num? get roleId => _roleId;
  num? get featured => _featured;
  num? get status => _status;
  String? get active => _active;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get roleName => _roleName;
  String? get professionName => _professionName;
  String? get photoUrl => _photoUrl;
  List<IdProof>? get idProof => _idProof;
  List<UserMetaData>? get userMetaData => _userMetaData;
  List<UserProfession>? get userProfession => _userProfession;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['city'] = _city;
    map['state'] = _state;
    map['profession_id'] = _professionId;
    map['customer_id'] = _customerId;
    map['photo'] = _photo;
    map['about'] = _about;
    map['referal_code'] = _referalCode;
    map['email_verified_at'] = _emailVerifiedAt;
    map['mobile_verified_at'] = _mobileVerifiedAt;
    map['auth_token'] = _authToken;
    map['fcm_tokan'] = _fcmTokan;
    map['facebook_id'] = _facebookId;
    map['google_id'] = _googleId;
    map['role_id'] = _roleId;
    map['featured'] = _featured;
    map['status'] = _status;
    map['active'] = _active;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['role_name'] = _roleName;
    map['profession_name'] = _professionName;
    map['photo_url'] = _photoUrl;
    if (_idProof != null) {
      map['id_proof'] = _idProof?.map((v) => v.toJson()).toList();
    }
    if (_userMetaData != null) {
      map['user_meta_data'] = _userMetaData?.map((v) => v.toJson()).toList();
    }
    if (_userProfession != null) {
      map['user_profession'] = _userProfession?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
