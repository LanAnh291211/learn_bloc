import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class ToDoListBloc extends Bloc<ToDoListEvent, ToDoListState> {
  ToDoListBloc() : super(const ToDoListState(ToDoStateType.initial, [])) {
    on<Add>((event, emit) {
      emit(state.copyWith(ToDoStateType.loaded, state.list + [event.content]));
    });

    on<Delete>((event, emit) {
      state.list.removeAt(event.index);

      emit(state.copyWith(ToDoStateType.loaded, state.list));
    });
  }
}
