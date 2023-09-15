part of 'internet_bloc.dart';

@immutable
sealed class InternetState {}

final class InternetInitial extends InternetState {}

class InternetConnectedState extends InternetState {
  final String message;
  InternetConnectedState({required this.message});
}

class InternetNotConnectedState extends InternetState {
  final String message;
  InternetNotConnectedState({required this.message});
}
