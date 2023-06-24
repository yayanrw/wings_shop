import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:wings_shop/core/router/router.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  http.Client get httpClient => http.Client();

  @singleton
  AppRouter get appRouter => AppRouter();
}
