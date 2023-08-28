part of 'advicer_bloc.dart';

@immutable
abstract class AdvicerState {}

class AdvicerInitial extends AdvicerState {
  final inital;
  AdvicerInitial({required this.inital});
}
class AdvicerLoadingState extends AdvicerState {}
class AdvicerLoadedState extends AdvicerState {
  final advice;
  AdvicerLoadedState({required this.advice});
}
class AdvicerErrorState extends AdvicerState {
  final message;
  AdvicerErrorState({required this.message});
}