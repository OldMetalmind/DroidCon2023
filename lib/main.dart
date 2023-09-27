import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop/src/blocs/task_cubit.dart';
import 'package:workshop/src/views/todo_add_page.dart';
import 'package:workshop/src/views/todos_page.dart';

const droidConGreen = Color(0xAA7de1c3);
const droidConBlue = Color(0xAA0d15e6);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const TodoPage(),
          '/add': (context) => const TodoAddPage(),
        },
      ),
    );
  }
}
