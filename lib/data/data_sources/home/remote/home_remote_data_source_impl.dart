import 'dart:convert';

import 'package:top_up_app/data/data_sources/home/home_remote_data_source.dart';
import 'package:top_up_app/data/models/top_up_model.dart';
import 'package:top_up_app/data/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/server_exception.dart';
import '../../../../main.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  static const apiKey = '67a248e2409de5ed5254eed2';
  static const baseUrl = 'https://$apiKey.mockapi.io/api/v1/';

  @override
  Future<void> addTopUp(TopUpModel topUp) {
    // TODO: implement addTopUp
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getProfile() {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future<List<TopUpModel>> getTopUpList() async {
    try {
      final response = await client.get(Uri.parse('${baseUrl}top_up_list'));
      logger.e(
          "ResponseIssue: ${response.body.toString()}  ${response.statusCode}");
      if (response.statusCode == 200) {
        final List<dynamic> responseBody = json.decode(response.body);

        final List<TopUpModel> topUpList = responseBody
            .map((e) => TopUpModel.fromJson(e as Map<String, dynamic>))
            .toList();

        return topUpList;
      } else {
        throw ServerException();
      }
    } catch (e) {
      logger.e("ResponseIssue : $e");
      throw ServerException();
    }
  }
}
