import 'package:flutter_hasura_subscription/app/app_controller.dart';
import 'package:flutter_hasura_subscription/app/modules/todo/todo_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hasura_subscription/app/app_widget.dart';
import 'package:flutter_hasura_subscription/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter('/todo', module: TodoModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
