import 'package:top_up_app/data/models/beneficiary_model.dart';

class Beneficiary {
  String? id;
  String? nickname;
  String? phoneNumber;
  String? createdAt;

  Beneficiary({this.id, this.nickname, this.phoneNumber, this.createdAt});

  BeneficiaryModel toModel() {
    return BeneficiaryModel(
        id: id,
        nickname: nickname,
        phoneNumber: phoneNumber,
        createdAt: createdAt);
  }
}
