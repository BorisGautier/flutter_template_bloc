import 'package:flutter_template_bloc/src/core/app/bloc/app_bloc.dart';
import 'package:flutter_template_bloc/src/core/helpers/network.dart';
import 'package:flutter_template_bloc/src/core/helpers/sharedpreferences.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  /* final chopper = ChopperClient(
      services: [],
      interceptors: [const HeadersInterceptor({})],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter());*/

  //Utils
  getIt.registerLazySingleton<NetworkInfoHelper>(() => NetworkInfoHelper());
  getIt.registerLazySingleton<SharedPreferencesHelper>(
      () => SharedPreferencesHelper());

  //ApiService

  //Repository

  //Bloc
  getIt.registerFactory<AppBloc>(() => AppBloc());
}
