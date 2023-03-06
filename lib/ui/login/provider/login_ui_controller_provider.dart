import 'package:one_school/ui/login/controller/login_ui_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'login_ui_controller_provider.g.dart';

@Riverpod(keepAlive: true)
LoginUiController loginUiController(LoginUiControllerRef ref) {
  return LoginUiController();
}