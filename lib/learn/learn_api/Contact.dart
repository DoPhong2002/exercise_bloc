class Contact {
  Contact({
      this.id,
      this.name,
      this.avatar,
      this.createdDate,});

  Contact.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    createdDate = json['createdDate'];
  }
  int? id;
  String? name;
  String? avatar;
  String? createdDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['avatar'] = avatar;
    map['createdDate'] = createdDate;
    return map;
  }

}