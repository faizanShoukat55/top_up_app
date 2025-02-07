import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:top_up_app/core/utils/enums.dart';
import 'package:top_up_app/domain/entities/top_up.dart';
import 'package:top_up_app/domain/repositories/home_repository.dart';
import 'package:top_up_app/domain/use_cases/get_home_repository.dart';

import 'get_home_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<HomeRepository>()])
void main() {
  late GetHomeRepository useCase;
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    useCase = GetHomeRepository(homeRepository: mockHomeRepository);
  });

  final List<TopUp> topUpList = [
    TopUp(
      id: "1",
      beneficiaryName: "Faizan Shoukat",
      accountNumber: "+971708090900",
      amount: "100",
      currency: "AED",
      type: TopUpType.debit,
      createdAt: "2025-02-07T16:43:56.847",
    ),
    TopUp(
      id: "2",
      beneficiaryName: "Yazan",
      accountNumber: "+971708090901",
      amount: "1000",
      currency: "AED",
      type: TopUpType.debit,
      createdAt: "2025-02-07T17:43:56.847",
    ),
  ];

  test('should return a list of TopUp entities when getTopUpList is called', () async {
    // arrange
    when(mockHomeRepository.getTopUpList())
        .thenAnswer((_) async => Right(topUpList));

    // act
    final result = await useCase();

    // assert
    expect(result, Right(topUpList));
    verify(mockHomeRepository.getTopUpList());
    verifyNoMoreInteractions(mockHomeRepository);
  });
}