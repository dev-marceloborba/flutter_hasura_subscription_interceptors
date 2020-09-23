// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $TodoController = BindInject(
  (i) => TodoController(i<TodoRepository>()),
  singleton: false,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoController on _TodoControllerBase, Store {
  final _$streamAtom = Atom(name: '_TodoControllerBase.stream');

  @override
  ObservableStream<List<TodoModel>> get stream {
    _$streamAtom.reportRead();
    return super.stream;
  }

  @override
  set stream(ObservableStream<List<TodoModel>> value) {
    _$streamAtom.reportWrite(value, super.stream, () {
      super.stream = value;
    });
  }

  final _$getStreamAsyncAction = AsyncAction('_TodoControllerBase.getStream');

  @override
  Future getStream() {
    return _$getStreamAsyncAction.run(() => super.getStream());
  }

  @override
  String toString() {
    return '''
stream: ${stream}
    ''';
  }
}
