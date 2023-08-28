import 'package:advicer/data/repository/advicer_repo_impl.dart';
import 'package:advicer/domain/entity/advice_entity.dart';
import 'package:advicer/domain/failure/failure.dart';

import 'package:dartz/dartz.dart';

import '../repository/advice_repo.dart';
class AdviceUseCase{
 AdviceUseCase({required this.adviceRepo});
 final AdviceRepo adviceRepo;
  Future<Either<AdviceEntity,Failure>> requestAdvice()async{

    return  adviceRepo.getRequestedFromDataSource();
    //  return Left(AdviceEntity(id: 1, advice: "here is your advice"));
     
  }
}