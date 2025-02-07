import 'dart:convert';

import 'package:top_up_app/data/data_sources/home/home_remote_data_source.dart';
import 'package:top_up_app/data/models/top_up_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/server_exception.dart';
import '../../../../main.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  static const apiKey = '67a248e2409de5ed5254eed2';
  static const baseUrl = 'https://$apiKey.mockapi.io/api/v1/';

  @override
  Future<TopUpModel> addTopUp(TopUpModel topUp) async {
    try {
      logger.e("ResponseIssue : requestBody ${topUp.toJson()}");
      final response = await client.post(Uri.parse('${baseUrl}top_up_list'),
          body: topUp.toJson());
      logger.e("ResponseIssue : response ${response.request.toString()} ${response.body.toString()}");

      if (response.statusCode == 201) {
        return TopUpModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException();
      }
    } catch (e) {
      logger.e("ResponseIssue : $e");
      throw ServerException();
    }
  }



  @override
  Future<List<TopUpModel>> getTopUpList() async {
    try {
      final response = await client.get(Uri.parse('${baseUrl}top_up_list'));
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
