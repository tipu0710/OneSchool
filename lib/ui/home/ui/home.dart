import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_school/service/hive/hivedata.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            HiveData.data.removeLoginModel(ref);
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
