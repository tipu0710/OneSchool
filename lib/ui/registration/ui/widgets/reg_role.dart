import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_school/ui/registration/controller/registration_ui_abs.dart';
import 'package:one_school/ui/registration/provider/registration_provider.dart';

class RegRoleField extends ConsumerWidget {
  const RegRoleField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var roleController = ref.watch(
        registrationUiHolderProvider.select((value) => value.roleController));
    return PhysicalModel(
      color: Colors.transparent,
      shadowColor: const Color.fromARGB(49, 130, 130, 130),
      elevation: 15,
      borderRadius: BorderRadius.circular(8),
      child: TextFormField(
        controller: roleController,
        onTap: () async {
          var role = await _showPicker(context);
          if (role != null) {
            roleController.text = role.name;
          }
        },
        readOnly: true,
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Select role";
          } else {
            return null;
          }
        },
        style: const TextStyle(
          fontSize: 12,
          color: Color.fromARGB(255, 18, 18, 18),
          fontWeight: FontWeight.w400,
        ),
        decoration: const InputDecoration(
          prefixIcon: Icon(CupertinoIcons.person_2_fill),
          label: Text("Role"),
        ),
      ),
    ).animate().fade(delay: 1400.ms, curve: Curves.easeInOut);
  }

  Future<Role?> _showPicker(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(CupertinoIcons.person_fill),
                  title: const Text('Teacher'),
                  onTap: () {
                    Navigator.of(context).pop(Role.Teacher);
                  }),
              ListTile(
                leading: const Icon(CupertinoIcons.person_2_fill),
                title: const Text('Parent'),
                onTap: () {
                  Navigator.of(context).pop(Role.Parent);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
