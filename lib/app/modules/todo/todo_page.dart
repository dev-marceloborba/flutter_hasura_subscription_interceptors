import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'todo_controller.dart';

class TodoPage extends StatefulWidget {
  final String title;
  const TodoPage({Key key, this.title = "Todo"}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends ModularState<TodoPage, TodoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Back to home'),
            onPressed: () {
              Modular.to.pushReplacementNamed('/');
            },
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                if (controller.stream?.hasError ?? false) {
                  print(controller.stream.error);
                  return Center(
                    child: Text(controller.stream.error),
                  );
                }

                if (controller.stream?.value == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final list = controller.stream.value;

                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text(
                        list[index].todo,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
