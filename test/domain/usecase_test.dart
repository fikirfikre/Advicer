import 'package:advicer/data/models/advicer_model.dart';
import 'package:advicer/data/repository/advicer_repo_impl.dart';
import 'package:advicer/domain/entity/advice_entity.dart';
import 'package:advicer/domain/failure/failure.dart';
import 'package:advicer/domain/repository/advice_repo.dart';
import 'package:advicer/domain/usecase/advice_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdvicerRepoImpl>()])
void main(){
   group("Testing Usecase", () { 
    group("returning AdviceEntity", () { 
      test("AdviceEntity", () async{
        final mockAdviceRepo = MockAdvicerRepoImpl();
        final adviceUseCaseUnderTest = AdviceUseCase(adviceRepo: mockAdviceRepo);
       
        when(mockAdviceRepo.getRequestedFromDataSource()).thenAnswer((realInvocation) => Future.value( left(const AdviceEntity(advice_id: 1, advice: "test advice"))));
       final result =await adviceUseCaseUnderTest.requestAdvice();
        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result,const Left<AdviceEntity,Failure>(AdviceEntity(advice_id: 1, advice: "test advice")));
        verify(mockAdviceRepo.getRequestedFromDataSource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepo);
      });
    });
    group("return Failure if an Exception occur", () {
            test("return Server Failure if  the Exception throws because of Server", () async{
        final mockAdviceRepo = MockAdvicerRepoImpl();
        final adviceUseCaseUnderTest = AdviceUseCase(adviceRepo: mockAdviceRepo);
       
        when(mockAdviceRepo.getRequestedFromDataSource()).thenAnswer((realInvocation) => Future.value( Right(ServerFailure())));
       final result =await adviceUseCaseUnderTest.requestAdvice();
        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result,Right<AdviceEntity,Failure>(ServerFailure()));
        verify(mockAdviceRepo.getRequestedFromDataSource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepo);
      });

      test("return General Failure if  the Exception throws", () async{
        final mockAdviceRepo = MockAdvicerRepoImpl();
        final adviceUseCaseUnderTest = AdviceUseCase(adviceRepo: mockAdviceRepo);
       
        when(mockAdviceRepo.getRequestedFromDataSource()).thenAnswer((realInvocation) => Future.value( Right(GeneralFailure())));
       final result =await adviceUseCaseUnderTest.requestAdvice();
        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result,Right<AdviceEntity,Failure>(GeneralFailure()));
        verify(mockAdviceRepo.getRequestedFromDataSource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepo);
      });
    });
     });
   }