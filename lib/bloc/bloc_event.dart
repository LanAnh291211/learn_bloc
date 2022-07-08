part of 'bloc_bloc.dart';

@immutable
abstract class ToDoListEvent {}

class Add extends ToDoListEvent {
  final String item;
  Add(this.item);
}

class Delete extends ToDoListEvent {
  final int index;
  Delete(this.index);
}

