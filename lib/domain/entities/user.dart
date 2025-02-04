import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String id;
  final double balance;
  final bool isVerified;

  const User({required this.id,required this.balance,required this.isVerified});

  @override
  List<Object> get props => [id, balance, isVerified];
}