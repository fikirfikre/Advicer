import 'package:advicer/data/Exception/exception.dart';
import 'package:advicer/data/datasource/advice_remote_datasource.dart';
import 'package:advicer/data/models/advicer_model.dart';
import 'package:advicer/data/repository/advicer_repo_impl.dart';
import 'package:advicer/domain/entity/advice_entity.dart';
import 'package:advicer/domain/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdvicerRemoteDatasourceImpl>()])
void main(){
  group("Repository test", () { 
    group("return Advice Entity", () {
       test("return Advice Model", () async{
        final mockadvicerRemoteDatasource = MockAdvicerRemoteDatasourceImpl();
        final advicerRepo = AdvicerRepoImpl(adviceRemoteDatasource: mockadvicerRemoteDatasource);

        when(mockadvicerRemoteDatasource.getAdviceFromApi()).thenAnswer((realInvocation) => Future.value(AdvicerModel(advice_id: 1, advice: "test advice")));
        final result = await advicerRepo.getRequestedFromDataSource();
        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result,left<AdvicerModel,Failure>(AdvicerModel(advice_id: 1, advice: 'test advice')));
        verify(mockadvicerRemoteDatasource.getAdviceFromApi()).called(1);
        verifyNoMoreInteractions(mockadvicerRemoteDatasource);
       });
     });
  });
  group("it will return failure", () {
    group("return Failure when  exception occur", (
    ) { 
      test("return Server Failure", () async{
        final mockadviceRemoteDatasource = MockAdvicerRemoteDatasourceImpl();
        final advicerRepoUnderTest = AdvicerRepoImpl(adviceRemoteDatasource: mockadviceRemoteDatasource);

        when(mockadviceRemoteDatasource.getAdviceFromApi()).thenThrow(ServerException());
        final result = await advicerRepoUnderTest.getRequestedFromDataSource();
        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<AdviceEntity,Failure>(ServerFailure()));
        verify(mockadviceRemoteDatasource.getAdviceFromApi());
        verifyNoMoreInteractions(mockadviceRemoteDatasource);
      });

            test("return General Failure", () async{
        final mockadviceRemoteDatasource = MockAdvicerRemoteDatasourceImpl();
        final advicerRepoUnderTest = AdvicerRepoImpl(adviceRemoteDatasource: mockadviceRemoteDatasource);

        when(mockadviceRemoteDatasource.getAdviceFromApi()).thenThrow(GeneralException());
        final result = await advicerRepoUnderTest.getRequestedFromDataSource();
        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<AdviceEntity,Failure>(GeneralFailure()));
        verify(mockadviceRemoteDatasource.getAdviceFromApi());
        verifyNoMoreInteractions(mockadviceRemoteDatasource);
      });
    });
   });
}