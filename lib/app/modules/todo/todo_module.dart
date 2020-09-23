import 'package:flutter_hasura_subscription/app/modules/todo/repository/todo_repository.dart';
import 'package:flutter_hasura_subscription/app/modules/todo/todo_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_hasura_subscription/app/modules/todo/todo_page.dart';

class TodoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $TodoController,
        $TodoRepository,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => TodoPage()),
      ];

  static Inject get to => Inject<TodoModule>.of();
}
