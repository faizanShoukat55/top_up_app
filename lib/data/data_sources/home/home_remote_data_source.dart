import '../../models/top_up_model.dart';


abstract class HomeRemoteDataSource {
  Future<List<TopUpModel>> getTopUpList();

  Future<TopUpModel> addTopUp(TopUpModel topUp);

}
