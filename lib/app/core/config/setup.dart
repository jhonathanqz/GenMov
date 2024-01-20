import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../constants/app_token.dart';

setupEnv() {
  AppToken.urlBase = dotenv.get('BASE_PATH');
}
