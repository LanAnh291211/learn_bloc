part of 'bloc_bloc.dart';

@immutable
abstract class ToDoListEvent {}

class Add extends ToDoListEvent {
  final String content;
  Add(this.content);
}

class Delete extends ToDoListEvent {
  final int index;
  Delete(this.index);
}
