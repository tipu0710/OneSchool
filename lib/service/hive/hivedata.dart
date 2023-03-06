import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:one_school/ui/login/model/login_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'hivedata.g.dart';

final _loginProvider = StateProvider<bool>((ref) {
  return HiveData.data.getLoginModel() != null;
});

@Riverpod(keepAlive: true)
bool login(LoginRef ref) {
  return ref.watch(_loginProvider);
}

class HiveData {
  HiveData._();

  HiveData();

  static const String _loginModel = "LoginModel";
  static const String _loginBoxName = "LoginBox";

  static final HiveData data = HiveData._();

  late final String appVersion;

  late Box<LoginModel> _loginBox;

  initSP() async {
    await Hive.initFlutter();
    Hive.registerAdapter(LoginModelAdapter());
    _loginBox = await Hive.openBox<LoginModel>(_loginBoxName);
  }

  bool setLoginModel(LoginModel loginModel, WidgetRef ref) {
    try {
      _loginBox.put(_loginModel, loginModel);
      ref.read(_loginProvider.notifier).state = true;
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  LoginModel? getLoginModel() {
    return _loginBox.get(_loginModel);
  }

  Future<void> removeLoginModel(WidgetRef ref) async {
    await _loginBox.delete(_loginModel);

    ref.read(_loginProvider.notifier).state = false;
  }
}
