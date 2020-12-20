import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfigEnv {
  String baseApiUrl;
  String env;

  AppConfigEnv() {
    this.baseApiUrl = DotEnv().env['BASE_API_URL'];
    this.env = DotEnv().env['ENV'];
  }

  static AppConfigEnv _instance;

  static loadEnv(String env) async {
    await DotEnv().load('env/$env');
  }

  // use Static block, caching the values improves performance - accessing  directly many times is bad
  static AppConfigEnv getInstance() {
    if (_instance == null) {
      _instance = AppConfigEnv();
      return _instance;
    }
    return _instance;
  }
}
