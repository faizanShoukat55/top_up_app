

class User {
  String? id;
  String? name;
  double? balance;
  bool? isVerified;
  bool? isBalanceVisible;

  User(
      {this.id,
      this.name,
      this.balance,
      this.isVerified,
      this.isBalanceVisible});

  User copyWith(
      {String? id,
      String? name,
      double? balance,
      bool? isVerified,
      bool? isBalanceVisible}) {
    return User(
        id: id ?? this.id,
        name: name ?? this.name,
        balance: balance ?? this.balance,
        isVerified: isVerified ?? this.isVerified,
        isBalanceVisible: isBalanceVisible ?? this.isBalanceVisible);
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    balance = json['balance'] ?? 0.0;
    isVerified = json['isVerified'] ?? true;
    isBalanceVisible = json['isBalanceVisible'] ?? true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['balance'] = balance;
    data['isVerified'] = isVerified;
    data['isBalanceVisible'] = isBalanceVisible;
    return data;
  }
}
