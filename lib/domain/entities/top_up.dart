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
}
