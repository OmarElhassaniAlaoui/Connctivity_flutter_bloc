import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? _connectivitySubscription;

  InternetBloc() : super(InternetInitial()) {
    
    on<InternetEvent>((event, emit) {
      if (event is InternetConnectedEvent) {
        emit(InternetConnectedState(message: 'Connected'));

      } else if (event is InternetNotConnectedEvent) {
        emit(InternetNotConnectedState(message: 'Not Connected'));
      }
    }); 

    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile || event == ConnectivityResult.wifi) {
        add(InternetConnectedEvent());
      } else {
        add(InternetNotConnectedEvent());
      }
    });

  }
  @override
  Future<void> close() {
    _connectivitySubscription!.cancel();
    return super.close();
  }
}

