import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/color_constants.dart';
import '../controller/filter_controller.dart';
import '../controller/todo_controller.dart';
import 'component/todo_action_button.dart';
import 'component/todo_list.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoController = Get.put(TodoController());
    final filterController = Get.put(FilterController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        elevation: 0,
        leading: IconButton(
          icon: Obx(
            () => Icon(
              filterController.hideDone
                  ? Icons.filter_alt
                  : Icons.filter_alt_outlined,
            ),
          ),
          onPressed: filterController.toggleHide,
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Obx(
            () {
              final todos = todoController.todos;
              return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return TodoTile(key: Key(todo.id), todo: todo);
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        backgroundColor: ColorConstant.appBarColor,
        onPressed: todoController.onTapAdd,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
