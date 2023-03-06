import 'package:one_school/ui/registration/controller/registration_ui_holder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'registration_provider.g.dart';

@Riverpod(keepAlive: true)
RegistrationUiHolder registrationUiHolder(RegistrationUiHolderRef ref) {
  return RegistrationUiHolder();
}