part of 'bloc_bloc.dart';

@immutable
class ToDoListState {
  final ToDoStateType type;
  final List<String> list;// 1 cái list rỗng
  const ToDoListState(this.type, this.list);

  ToDoListState copyWith(
    ToDoStateType newType,
    List<String> newList,
  ) =>
      ToDoListState(
        newType,
        newList,
      );
}


enum ToDoStateType {
  initial,
  loaded,
  loading,
}
