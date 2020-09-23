import 'package:flutter_hasura_subscription/app/modules/todo/model/todo_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:shared_preferences_cache_interceptor/shared_preferences_cache_interceptor.dart';

part 'todo_repository.g.dart';

@Injectable(singleton: true)
class TodoRepository implements Disposable {
  HasuraConnect _hasura;
  Snapshot _snapshot;

  TodoRepository() {
    connection();
  }

  void connection() {
    _hasura = HasuraConnect(
      'url',
      headers: {},
      interceptors: [
        SharedPreferencesCacheInterceptor(),
      ],
    );
  }

  Future<Stream<List<TodoModel>>> getTodos() async {
    final document = """
      subscription MySubscription {
          todo {
            id
            todo
          }
      }
     """;
    _snapshot = await _hasura.subscription(document);
    return _snapshot.map(
      (data) {
        if (data == null) {
          return null;
        }

        final result = data['data']['todo'] as List;

        return (result)
            .map((item) => item.cast<String, dynamic>())
            .map<TodoModel>((item) => TodoModel.fromMap(item))
            .toList();
      },
    );
  }

  @override
  void dispose() {
    print('snapshot dispose');
    _snapshot.close();
  }
}
