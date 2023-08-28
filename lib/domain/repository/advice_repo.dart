import 'package:advicer/domain/entity/advice_entity.dart';
import 'package:dartz/dartz.dart';

import '../failure/failure.dart';

abstract class AdviceRepo {
  Future<Either<AdviceEntity,Failure>> getRequestedFromDataSource();
}