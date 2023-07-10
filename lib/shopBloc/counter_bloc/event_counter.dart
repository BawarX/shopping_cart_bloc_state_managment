import 'package:equatable/equatable.dart';

class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class IncrementEventButton extends CounterEvent {}

class DecrementEventButton extends CounterEvent {}
