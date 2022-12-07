import 'package:bloc/bloc.dart';
import 'package:pr4_cubit/home/cubit/list_state.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(ListState(history: []));

  void addHistory(String action) {
    List history = state.history;
    history.add(action);
    emit(ListState(history: history));
  }
}