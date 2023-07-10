import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/shopBloc/counter_bloc/event_counter.dart';
import 'package:shopping_cart/shopBloc/counter_bloc/state_counter.dart';

class CounterBloc extends Bloc<String, int> {
  int countPressed = 0;
  CounterBloc() : super(0) {
    on<String>((event, emit) async {
      if (event == "+") {
        countPressed += 1;
        emit(countPressed);
      }
    });
  }
}
