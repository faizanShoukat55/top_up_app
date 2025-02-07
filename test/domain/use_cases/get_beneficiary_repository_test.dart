import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:top_up_app/domain/entities/beneficiary.dart';
import 'package:top_up_app/domain/repositories/beneficiary_repository.dart';
import 'package:top_up_app/domain/use_cases/get_beneficiary_repository.dart';

import 'get_beneficiary_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<BeneficiaryRepository>()])
void main() {
  late GetBeneficiaryRepository useCase;
  late MockBeneficiaryRepository mockBeneficiaryRepository;

  setUp(() {
    mockBeneficiaryRepository = MockBeneficiaryRepository();
    useCase = GetBeneficiaryRepository(beneficiaryRepository: mockBeneficiaryRepository);
  });

  final List<Beneficiary> pBeneficiaryList = [
    Beneficiary(id: "1", nickname: "Faizan Shoukat", phoneNumber: "+971708090900", createdAt: "2025-02-07T16:43:56.847"),
    Beneficiary(id: "2", nickname: "Yazan", phoneNumber: "+971708090901", createdAt: "2025-02-07T16:43:56.847"),
  ];

  test('should get beneficiary list from repository', () async {
    // arrange
    when(mockBeneficiaryRepository.getBeneficiaries())
        .thenAnswer((_) async => Right(pBeneficiaryList));

    // act
    final result = await useCase(); // Assuming the use case has a `call()` method

    // assert
    expect(result, Right(pBeneficiaryList)); // Handle the Either type
    verify(mockBeneficiaryRepository.getBeneficiaries());
    verifyNoMoreInteractions(mockBeneficiaryRepository);
  });
}
