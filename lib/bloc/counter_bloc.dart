import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(count : 0)) {
    on<CounterIncrementPressed>(counterIncrementPressed);
    on<CounterDecrementPressed>(counterDecrementPressed);
  }

  void counterIncrementPressed(CounterIncrementPressed event, Emitter<CounterState> emit) {
    final counterState = state as CounterInitial;
    emit(CounterInitial(count: counterState.count + 1));
  }

  void counterDecrementPressed(CounterDecrementPressed event, Emitter<CounterState> emit) {
    final counterState = state as CounterInitial;
    emit(CounterInitial(count : counterState.count - 1));
  }
}
