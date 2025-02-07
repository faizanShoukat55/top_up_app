

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:top_up_app/domain/entities/beneficiary.dart';
import 'package:top_up_app/domain/repositories/beneficiary_repository.dart';
import 'package:top_up_app/domain/use_cases/get_beneficiary_repository.dart';

import 'get_beneficiary_repository_test.mocks.dart';

//import 'get_popular_movies_test.mocks.dart';

@GenerateNiceMocks([MockSpec<BeneficiaryRepository>()])

void main(){
  late GetBeneficiaryRepository   useCase;
  late MockBeneficiaryRepository mockBeneficiaryRepository;

  setUp(() {
    mockBeneficiaryRepository=MockBeneficiaryRepository();
    useCase=GetBeneficiaryRepository( beneficiaryRepository: mockBeneficiaryRepository);
  });

  final pBeneficiaryList=[
    Beneficiary(id:"1", nickname: "Faizan Shoukat", phoneNumber: "+971708090900", createdAt: "2025-02-07T16:43:56.847"),
    Beneficiary(id: "2", nickname: "Yazan", phoneNumber: "+971708090901", createdAt: "2025-02-07T16:43:56.847"),
  ];

  test('should popular trending movies from repository', ()  async{


    // arrange
    when(mockBeneficiaryRepository.getBeneficiaries())
        .thenAnswer((_) async => Right(pBeneficiaryList));
    //act
    final result= useCase;

    //assert
    expect(result, pBeneficiaryList);
    verify(mockBeneficiaryRepository.getBeneficiaries());
    verifyNoMoreInteractions(mockBeneficiaryRepository);


  });
}