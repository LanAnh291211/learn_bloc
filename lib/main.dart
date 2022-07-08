import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',// mỗi ng 1 cách code mà a :v thôi kệ đi :v 
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoListBloc(),
      child: BlocConsumer<ToDoListBloc, ToDoListState>(
        listener: (context, state) {
         
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Flutter Demo'),
            ),
            body: body(state),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                final bloc = context.read<ToDoListBloc>();
                bloc.add(Add('Hello Vivian'));
              },
              child: const Icon(Icons.add),
            ),

            
            
          );
        },
      ),
    );
  }

  Widget body(ToDoListState state) {
    switch (state.type) {
      case ToDoStateType.initial:
        return Container(
          color: Colors.red,
        );

      case ToDoStateType.loaded:
        return ListView.builder(
          itemCount: state.list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state.list[index]),
              onTap: () {
                final bloc = context.read<ToDoListBloc>();
                bloc.add(Delete(index));
              },
            );
          },
        );

      default:
        return Container(
          color: Colors.green,
        );
    }
  }
}

