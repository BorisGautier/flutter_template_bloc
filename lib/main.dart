// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_bloc/src/app.dart';
import 'package:flutter_template_bloc/src/core/app/bloc/app_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_template_bloc/blocobserver.dart';
import 'package:flutter_template_bloc/src/core/di/di.dart' as di;

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await di.init();
    await HydratedStorage.build(
      storageDirectory: await getApplicationSupportDirectory(),
    );

    runApp(BlocProvider(
      create: (_) => di.getIt<AppBloc>(),
      child: const MyApp(),
    ));

    Bloc.observer = SimpleBlocObserver();
  }, (error, stackTrace) {
    print('runZonedGuarded: Caught error in my root zone.');
    print(stackTrace);
    print(error);
  });
}
