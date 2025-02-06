

class UserModel {
  String? id;
  String? name;
  num? totalBalance;
  bool? accountStatus;

  UserModel({
    this.id,
    this.name,
    this.totalBalance,
    this.accountStatus,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    totalBalance = json['totalBalance'] ?? 0.0;
    accountStatus = json['accountStatus'] ?? true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['totalBalance'] = totalBalance;
    data['accountStatus'] = accountStatus;
    return data;
  }
}