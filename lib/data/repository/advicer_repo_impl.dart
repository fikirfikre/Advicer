import 'package:advicer/data/Exception/exception.dart';
import 'package:advicer/data/datasource/advice_remote_datasource.dart';
import 'package:advicer/domain/entity/advice_entity.dart';

import 'package:advicer/domain/failure/failure.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/advice_repo.dart';

class AdvicerRepoImpl implements AdviceRepo{
  AdvicerRepoImpl({required this.adviceRemoteDatasource});
  final AdvicerRemoteDatasource adviceRemoteDatasource;
  @override
  Future<Either<AdviceEntity, Failure>> getRequestedFromDataSource() async {
      
    try {
      final result = await adviceRemoteDatasource.getAdviceFromApi();
      return left(result);
    }on ServerException catch(_){
      return right(ServerFailure());
    }
     catch (e) {
      return right(GeneralFailure());
    }

   
  }

}