import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial(inital: "Your advice are waiting for you!")) {
    on<AdvicerRequestEvent>((event, emit) async {

      emit(AdvicerLoadingState());
      await Future.delayed(Duration(seconds: 3),(){});
      emit(AdvicerLoadedState(advice: "here is your advice"));

    });
  }
}
