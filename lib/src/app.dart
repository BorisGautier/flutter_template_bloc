// ignore_for_file: must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template_bloc/generated/l10n.dart';
import 'package:flutter_template_bloc/src/core/app/bloc/app_bloc.dart';
import 'package:flutter_template_bloc/src/core/di/di.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppBloc(),
          ),
        ],
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return MaterialApp(
              title: "flutter_template_bloc",
              theme: state.themeData,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              locale: state.locale,
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              home: Container(),
            );
          },
        ));
  }
}
