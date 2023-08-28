import 'package:advicer/domain/failure/failure.dart';
import 'package:advicer/domain/usecase/advice_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdviceUseCase  adviceUseCase;


  AdvicerCubit({required this.adviceUseCase}) : super(AdvicerCubitInitial(initial: "Your advices are waiting for you"));


  void requestAdvice() async{
  
    emit(AdvicerCubitLoadingState());
    var failureOrAdvice = await adviceUseCase.requestAdvice();
    failureOrAdvice.fold(
      (advice) =>emit(AdvicerCubitLoadedState(advice: advice.advice)) , 
      (failure) => emit(AdvicerCubitErrorState(message: _mapFailures(failure))));
    // emit(AdvicerCubitLoadedState(advice: advice.advice));
  }

   _mapFailures(Failure failure){
    switch (failure.runtimeType){
      case ServerFailure:
          return "uuups Server gone wrong!";
      case CacheFailure:
           return "uuups Cache gone wrong!";
      case GeneralFailure:
          return  "uuups something gone wrong!";
      default:
           return "error occur";
    }

  }
}
