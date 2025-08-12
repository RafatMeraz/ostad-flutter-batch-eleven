import 'package:flutter/material.dart';
import 'package:todo_app/add_new_todo_screen.dart';
import 'package:todo_app/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          Todo todo = todoList[index];

          return ListTile(
            onLongPress: () {
              todoList.removeAt(index);
              setState(() {});
            },
            title: Text(todo.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todo.description),
                Text('Created date: ${todo.createdDate}'),
              ],
            ),
            trailing: Text(todo.status),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Todo? todo = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddNewTodoScreen();
              },
            ),
          );

          if (todo != null) {
            todoList.add(todo);
            setState(() {});
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
