import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int initialCounter = 0; 
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      if (event is IncrementEvent) {
        initialCounter = initialCounter + 1;
        emit(ChangeCounterValueState(initialCounter));
      } else if (event is DecrementEvent) {
        initialCounter = initialCounter - 1;
        emit(ChangeCounterValueState(initialCounter));
      } else if (event is ResetEvent) {
        initialCounter = 0;
        emit(ChangeCounterValueState(initialCounter));
      }
    });
  }
}
