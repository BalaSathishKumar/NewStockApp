/// status : true
/// messages : "Successfully Delete Chat History"

class ClearChatModel {
  ClearChatModel({
      bool? status, 
      String? messages,}){
    _status = status;
    _messages = messages;
}

  ClearChatModel.fromJson(dynamic json) {
    _status = json['status'];
    _messages = json['messages'];
  }
  bool? _status;
  String? _messages;
ClearChatModel copyWith({  bool? status,
  String? messages,
}) => ClearChatModel(  status: status ?? _status,
  messages: messages ?? _messages,
);
  bool? get status => _status;
  String? get messages => _messages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['messages'] = _messages;
    return map;
  }

}