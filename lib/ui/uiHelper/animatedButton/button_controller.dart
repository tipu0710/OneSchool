import 'package:flutter/foundation.dart';

enum AnimatedButtonState { running, idle }

class ButtonController extends ChangeNotifier implements _ButtonListenable {
  ButtonController();
  @override
  AnimatedButtonState get state => _value;

  AnimatedButtonState _value = AnimatedButtonState.idle;

  void start() {
    if (_value == AnimatedButtonState.running) {
      return;
    }
    _value = AnimatedButtonState.running;
    notifyListeners();
  }

  void stop() {
    if (_value == AnimatedButtonState.idle) {
      return;
    }
    _value = AnimatedButtonState.idle;
    notifyListeners();
  }
}

abstract class _ButtonListenable extends Listenable {
  const _ButtonListenable();

  AnimatedButtonState get state;
}
