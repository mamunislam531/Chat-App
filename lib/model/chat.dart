
class ChatModels {
  String? id;
  String? message;
  String? dateTime;

  ChatModels(this.id, this.message,this.dateTime);

  ChatModels.fromJson(dynamic json) {
    message = json['message'];
    id = json['id'];
    dateTime = json['dateTime'];
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['id'] = id;
    map['dateTime'] = dateTime;
    return map;
  }
}

