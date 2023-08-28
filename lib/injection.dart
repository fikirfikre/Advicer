import 'package:advicer/application/pages/advice_page/cubit/advicer_cubit.dart';
import 'package:advicer/data/datasource/advice_remote_datasource.dart';
import 'package:advicer/data/repository/advicer_repo_impl.dart';
import 'package:http/http.dart' as http;
import 'package:advicer/domain/usecase/advice_usecase.dart';
import 'package:get_it/get_it.dart';

import 'domain/repository/advice_repo.dart';

var sl = GetIt.instance;

Future<void> init() async{

  sl.registerFactory(() => AdvicerCubit(adviceUseCase: sl()));
  sl.registerFactory(() => AdviceUseCase(adviceRepo: sl()));
  sl.registerFactory<AdviceRepo>(() => AdvicerRepoImpl(adviceRemoteDatasource: sl()));
  sl.registerFactory<AdvicerRemoteDatasource>(() => AdvicerRemoteDatasourceImpl(client: sl()));
  sl.registerFactory(() => http.Client());
}