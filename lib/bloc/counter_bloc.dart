import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/counter_event.dart';
import 'package:learning_bloc/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<CounterIncrementPressed>(counterIncrementPressed);
    on<CounterDecrementPressed>(counterDecrementPressed);
  }

  void counterIncrementPressed(CounterIncrementPressed event, Emitter<CounterState> emit) {
    emit(CounterState(state.count + 1));
  }

  void counterDecrementPressed(CounterDecrementPressed event, Emitter<CounterState> emit) {
    emit(CounterState(state.count - 1));
  }
}
