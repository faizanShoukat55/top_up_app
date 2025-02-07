import 'package:top_up_app/domain/entities/beneficiary.dart';

class BeneficiaryModel {
  String? id;
  String? nickname;
  String? phoneNumber;
  String? createdAt;

  BeneficiaryModel({this.id, this.nickname, this.phoneNumber, this.createdAt});

  BeneficiaryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickname = json['nickname'];
    phoneNumber = json['phoneNumber'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nickname'] = nickname;
    data['phoneNumber'] = phoneNumber;
    data['createdAt'] = createdAt;
    return data;
  }

  Beneficiary toEntity() {
    return Beneficiary(
        id: id,
        nickname: nickname,
        phoneNumber: phoneNumber,
        createdAt: createdAt);
  }
}
