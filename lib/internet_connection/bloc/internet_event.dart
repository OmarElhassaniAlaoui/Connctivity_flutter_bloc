part of 'internet_bloc.dart';

@immutable
sealed class InternetEvent {}

class InternetConnectedEvent extends InternetEvent {

}
class InternetNotConnectedEvent extends InternetEvent {

}
