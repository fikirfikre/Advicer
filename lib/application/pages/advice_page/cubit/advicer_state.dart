part of 'advicer_cubit.dart';

abstract class AdvicerCubitState extends Equatable {
  const AdvicerCubitState();

  @override
  List<Object> get props => [];
}

class AdvicerCubitInitial extends AdvicerCubitState {
  String initial;
  AdvicerCubitInitial({required this.initial});
}

class AdvicerCubitLoadingState extends AdvicerCubitState {}

class AdvicerCubitLoadedState extends AdvicerCubitState {
  String advice;
  AdvicerCubitLoadedState({required this.advice});
}

class AdvicerCubitErrorState extends AdvicerCubitState {
  String message;
  AdvicerCubitErrorState({required this.message});
}
