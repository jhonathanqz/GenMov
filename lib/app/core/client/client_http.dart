import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../config/app_environment_setup.dart';
import '../config/environment.dart';
import '../constants/app_token.dart';
import 'client_factory.dart';

class ClientHTTP {
  ClientHTTP() {
    setupClient();
    setupClientJwt();
  }

  static Dio setupClientJwt() {
    getEnvironmentSettings();
    final client = ClientFactory.baseClientJwt!;
    client.options.baseUrl = AppToken.urlBase;
    client.options.headers = {
      'Authorization': 'Bearer ${AppToken.jwtToken}',
      'app-token': AppToken.jwtToken,
    };
    client.options.followRedirects = false;
    client.options.connectTimeout = const Duration(seconds: 30);
    client.options.receiveTimeout = const Duration(seconds: 30);
    if (AppEnvironmentSetup.environment != Environment.production) {
      //client.interceptors.add(prettier);
    }

    return client;
  }

  static Dio setupClient({
    String? urlBase,
  }) {
    getEnvironmentSettings();
    final client = ClientFactory.baseClient!;

    client.options.baseUrl = AppToken.urlBase;
    client.options.headers = {
      'Authorization': 'Bearer static:${AppToken.staticToken}',
      'app-token': AppToken.jwtToken,
    };
    client.options.followRedirects = false;
    client.options.connectTimeout = const Duration(seconds: 30);
    client.options.receiveTimeout = const Duration(seconds: 30);
    if (AppEnvironmentSetup.environment != Environment.production) {
      //client.interceptors.add(prettier);
    }
    return client;
  }

  static Dio get clientBase => setupClient();

  static Dio get clientJWT => setupClientJwt();

  static getEnvironmentSettings() {
    final String currentEnvironment = AppEnvironmentSetup.environment.name.toUpperCase();
    AppToken.staticToken = dotenv.get('STATIC_TOKEN');
    AppToken.urlBase = dotenv.get(currentEnvironment);
  }
}
