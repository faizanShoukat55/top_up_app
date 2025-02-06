import 'package:flutter/material.dart';
import 'package:top_up_app/core/utils/enums.dart';

import '../../domain/entities/top_up.dart';



class TopUpModel {
  String? id;
  String? beneficiaryName;
  String? accountNumber;
  String? amount;
  String? currency;
  TopUpType? type;
  String? createdAt;

  TopUpModel({
    this.id,
    this.beneficiaryName,
    this.accountNumber,
    this.amount,
    this.currency,
    this.type,
    this.createdAt,
  });

  TopUpModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    beneficiaryName = json['beneficiaryName'];
    accountNumber = json['accountNumber'];
    amount = json['amount'];
    currency = json['currency'];
    type =
        json['type'] != null ? _transactionTypeFromString(json['type']) : null;
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;

    data['beneficiaryName'] = beneficiaryName;
    data['type'] = type?.name;
    data['amount'] = amount;
    data['accountNumber'] = accountNumber;
    data['currency'] = currency;
    data['createdAt'] = createdAt;
    return data;
  }

  TopUpType? _transactionTypeFromString(String? type) {
    if (type == null) return null;
    for (var e in TopUpType.values) {
      if (e.name == type) return e;
    }
    debugPrint('Invalid transaction type: $type');
    return null;
  }

  /// Convert Model to entity
  TopUp toEntity() {
    return TopUp(
        id: id,
        beneficiaryName: beneficiaryName,
        accountNumber: accountNumber,
        amount: amount,
        currency: currency,
        type: type,
        createdAt: createdAt);
  }
}
