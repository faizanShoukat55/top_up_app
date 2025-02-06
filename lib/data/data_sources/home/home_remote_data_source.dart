import '../../models/top_up_model.dart';
import '../../models/user_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<TopUpModel>> getTopUpList();

  Future<void> addTopUp(TopUpModel topUp);

  Future<UserModel> getProfile();
}
