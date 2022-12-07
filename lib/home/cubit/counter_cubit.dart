import 'package:bloc/bloc.dart';
import 'package:pr4_cubit/home/cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit() : super(CounterState());

  void increment(){
    final count = state.count + 1;
    final updateState = CounterState(count: count);
    emit(updateState);
  }

  void decrement(){
    final count = state.count - 1;
    final updateState = CounterState(count: count);
    emit(updateState);
  }
}