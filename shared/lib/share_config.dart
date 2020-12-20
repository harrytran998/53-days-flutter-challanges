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

class MyTheme {
  // Follow TailwindCss base config
  static const unit0 = 0;
  static const unitBase = 1.0;
  static const unit0_5 = 2.0;
  static const unit1 = 4.0;
  static const unit1_5 = 6.0;
  static const unit2 = 8.0;
  static const unit2_5 = 10.0;
  static const unit3 = 12.0;
  static const unit3_5 = 14.0;
  static const unit4 = 16.0;
  static const unit5 = 20.0;
  static const unit6 = 24.0;
  static const unit7 = 28.0;
  static const unit8 = 32.0;
  static const unit9 = 36.0;
  static const unit10 = 40.0;
  static const unit11 = 44.0;
  static const unit12 = 48.0;
  static const unit14 = 56.0;
  static const unit16 = 64.0;
  static const unit20 = 80.0;

  static const regular = FontWeight.w400;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.w700;
  static const boldest = FontWeight.w900;
}
