import 'package:event_bus/event_bus.dart';

EventBus loginEventBus = EventBus();

class LoginEvent {
  bool isLogin;
  String token;

  LoginEvent(this.isLogin, this.token);
}
