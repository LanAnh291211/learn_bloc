import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class ToDoListBloc extends Bloc<ToDoListEvent, ToDoListState> {
  ToDoListBloc() : super(const ToDoListState(ToDoStateType.initial, [])) {
    on<Add>((event, emit) {
      final newState = state.copyWith(ToDoStateType.loaded, state.list + [event.item]);
      emit(newState);
    });

    on<Delete>((event, emit) {
      // viết hàm delete 1 cái item list ra á A :v 
      state.list.removeAt(event.index);
      final newState = state.copyWith(
        ToDoStateType.loaded,state.list
      );
      emit(newState);

    });
  }
}
