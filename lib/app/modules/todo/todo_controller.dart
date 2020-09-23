import 'package:flutter_hasura_subscription/app/modules/todo/model/todo_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:mobx/mobx.dart';

import 'repository/todo_repository.dart';

part 'todo_controller.g.dart';

@Injectable(singleton: false)
class TodoController = _TodoControllerBase with _$TodoController;

abstract class _TodoControllerBase with Store implements Disposable {
  final TodoRepository _repository;

  _TodoControllerBase(this._repository) {
    getStream();
  }

  @observable
  ObservableStream<List<TodoModel>> stream;

  @action
  getStream() async {
    var result = await _repository.getTodos();
    stream = result?.asObservable();
  }

  @override
  void dispose() {
    _repository.dispose();
  }
}
