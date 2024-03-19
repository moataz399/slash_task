import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/core/di/dependency_injection.dart';
import 'package:slash/core/helpers/bloc_observer.dart';
import 'package:slash/core/routing/app_router.dart';
import 'package:slash/slash_app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  await setUpGetIt();
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(SlashApp(appRouter: AppRouter()));
}
