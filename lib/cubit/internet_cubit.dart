import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  StreamSubscription? _connectivitySubscription;
  InternetCubit() : super(InternetInitial());

  void emitInternetConnected() { 
    emit(InternetConnectedState(message: 'Connected'));
  }
  
  void emitInternetDisconnected() { 
    emit(InternetNotConnectedState(message: 'Not Connected'));
  }

  void monitorInternetConnection() {
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile || event == ConnectivityResult.wifi) {
        emitInternetConnected();
      } else {
        emitInternetDisconnected();
      }
    });
  } 

   @override
  Future<void> close() {
    _connectivitySubscription!.cancel();
    return super.close();
  }
  
  

}
