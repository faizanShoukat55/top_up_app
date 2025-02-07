import 'package:top_up_app/data/models/top_up_model.dart';

import '../../core/utils/enums.dart';

class TopUp {
  String? id;
  String? beneficiaryName;
  String? accountNumber;
  String? amount;
  String? currency;
  TopUpType? type;
  String? createdAt;

  TopUp(
      {this.createdAt,
      this.beneficiaryName,
      this.type,
      this.amount,
      this.accountNumber,
      this.currency,
      this.id});


  TopUpModel toModel(){
    return TopUpModel(
        id: id,
        beneficiaryName: beneficiaryName,
        accountNumber: accountNumber,
        amount: amount,
        currency: currency,
        type: type,
        createdAt: createdAt);
  }

}
