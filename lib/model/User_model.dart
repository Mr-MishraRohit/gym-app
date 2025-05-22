class UserModel {
  UserModel();

  // List<Item> items = [];
  String full_name = "";
  String nick_name = "";
  String mobile_number ="";
  String gender = "";
  String age ="";
  String selected_unit = "";
  int weight = 00;
  int height = 00;
  String goal = "";
  String physical_level = "";
  String verificationId = "";
  bool donate = false;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt  = DateTime.now();
  DateTime publishedAt  = DateTime.now();

  UserModel.fromJson(Map<String, dynamic> jsonMap) {
    // List<dynamic> cC = jsonMap['items'] ?? [];
    // items = cC.map((e) => Item.fromJson(e)).toList();
    full_name = jsonMap["full_name"] ?? "";
    nick_name = jsonMap["nick_name"] ?? "";
    mobile_number = jsonMap["mobile_number"] ?? "";
    gender = jsonMap["gender"] ?? "";
    age = jsonMap["age"] ?? "";
    selected_unit = jsonMap["selected_unit"] ?? "";
    weight = jsonMap["weight"] ?? 00;
    height = jsonMap["height"] ?? 00;
    goal = jsonMap["goal"] ?? "";
    physical_level = jsonMap["physical_level"] ?? "";
    verificationId = jsonMap["verificationId"] ?? "";
    donate = jsonMap["donate"] ?? false;
    createdAt = jsonMap["createdAt"] == null ? DateTime.now() : DateTime.parse(jsonMap["createdAt"]);
    updatedAt = jsonMap["updatedAt"] == null ? DateTime.now() : DateTime.parse(jsonMap["updatedAt"]);
    publishedAt = jsonMap["publishedAt"] == null ? DateTime.now() : DateTime.parse(jsonMap["publishedAt"]);
  }
  Map toMap() {
    var map = Map<String, dynamic>();
    // map["items"] = items;
    map["full_name"] = full_name;
    map["mobile_number"] = mobile_number;
    map["nick_name"] = nick_name;
    map["gender"] =gender;
    map["age"] =age;
    map["selected_unit"] =selected_unit;
    map["weight"] = weight;
    map["height"] = height;
    map["goal"] = goal;
    map["physical_level"] = physical_level;
    map["donate"] = donate;
    map["createdAt"] = createdAt.toIso8601String();
    map["updatedAt"] = updatedAt.toIso8601String();
    map["publishedAt"] = publishedAt.toIso8601String();
    return map;
  }
}