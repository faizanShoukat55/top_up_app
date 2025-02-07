import 'dart:convert';

import 'package:top_up_app/data/models/beneficiary_model.dart';
import 'package:http/http.dart' as http;
import '../../../../core/error/server_exception.dart';
import '../../../../main.dart';
import '../beneficiary_remote_data_source.dart';

class BeneficiaryRemoteDataSourceImpl extends BeneficiaryRemoteDataSource {
  final http.Client client;

  BeneficiaryRemoteDataSourceImpl({required this.client});

  /// due to time constraints other wise will go for a separate class (Base URL and end points)
  static const apiKey = '67a248e2409de5ed5254eed2';
  static const baseUrl = 'https://$apiKey.mockapi.io/api/v1/';


  @override
  Future<BeneficiaryModel> addBeneficiary(BeneficiaryModel beneficiary) async {
    try {
      logger.e("ResponseIssue : requestBody ${beneficiary.toJson()}");
      final response = await client.post(Uri.parse('${baseUrl}beneficary'),
          body: beneficiary.toJson());
      logger.e(
          "ResponseIssue : response ${response.request.toString()} ${response.body.toString()}");

      /// mock api 201 (created)
      if (response.statusCode == 201) {
        final responseBody = json.decode(response.body);
        return BeneficiaryModel.fromJson(responseBody);
      } else {
        throw ServerException();
      }

    } catch (e) {
      logger.e("ResponseIssue : $e");
      throw ServerException();
    }
  }

  @override
  Future<List<BeneficiaryModel>> getBeneficiaries() async {
    try {
      final response = await client.get(Uri.parse('${baseUrl}beneficary'));
      if (response.statusCode == 200) {
        final List<dynamic> responseBody = json.decode(response.body);

        final List<BeneficiaryModel> beneficiaryList = responseBody
            .map((e) => BeneficiaryModel.fromJson(e as Map<String, dynamic>))
            .toList();

        return beneficiaryList;
      } else {
        throw ServerException();
      }
    } catch (e) {
      logger.e("ResponseIssue : $e");
      throw ServerException();
    }
  }
}
