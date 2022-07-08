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

// class ToDoListInitial extends ToDoListState {}

// class ToState {

//   ToState(this.type, this.list);

//   ToState copy(ToStateType newType, List<String> newList) => ToState(
//         newType,
//         newList,
//       );
// }

enum ToDoStateType {
  initial,
  loaded,
  loading,
}
