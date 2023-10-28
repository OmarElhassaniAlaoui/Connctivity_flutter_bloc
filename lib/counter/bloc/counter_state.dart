part of 'counter_bloc.dart';

sealed class CounterState {
  final int counterValue; 
  CounterState({
    required this.counterValue,
  });
}

class CounterInitial extends CounterState {
  CounterInitial() : super(counterValue: 0);
}

class ChangeCounterValueState extends CounterState {
  ChangeCounterValueState(int counterValue) : super(counterValue: counterValue);
}
/*
CounterIntial(){ 
  super(counterValue: 0); 
} 
ChangeCounterValueState(int counterValue){ 
  super(counterValue: counterValue); 
} 


*/