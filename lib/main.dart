import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_school/service/hive/hivedata.dart';
import 'package:one_school/service/router/router.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await HiveData.data.initSP();
  Animate.restartOnHotReload = true;
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}


class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var router = ref.watch(routerProvider);
    final textTheme = Theme.of(context).textTheme;
  
    return MaterialApp.router(
      title: 'OneSCHOOL',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 103, 21, 255),
          secondary: const Color.fromARGB(255, 103, 21, 255),
        ),
        textTheme: GoogleFonts.meriendaTextTheme(textTheme),
        inputDecorationTheme: const InputDecorationTheme().copyWith(
          contentPadding: const EdgeInsets.only(
            left: 25,
            right: 25,
            bottom: 0,
            top: 0,
          ),
          fillColor: const Color(0xffFFFFFF),
          focusColor: const Color(0xffFFFFFF),
          labelStyle: const TextStyle(
            fontSize: 12,
            color: Color(0xff707070),
            fontWeight: FontWeight.w400,
          ),
          floatingLabelStyle: const TextStyle(
            fontSize: 12,
            color: Color(0xff707070),
            fontWeight: FontWeight.w400,
          ),
          hintStyle: const TextStyle(
            fontSize: 12,
            color: Color(0xFF252525),
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          outlineBorder: const BorderSide(
            color: Color.fromARGB(255, 103, 21, 255),
            width: .4,
          ),
          disabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 103, 21, 255),
              width: .4,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 103, 21, 255),
              width: .8,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 103, 21, 255),
              width: .4,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.red,
              width: .8,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.red,
              width: .4,
            ),
          ),
        ),
      ),
      routerConfig: router,
    );
  }
}
