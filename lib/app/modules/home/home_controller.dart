import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

@Injectable(singleton: false)
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {}
