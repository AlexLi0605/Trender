import 'package:flutter/foundation.dart';

import 'package:envify/envify.dart';

part 'env.g.dart';

@Envify(path: kReleaseMode ? '.env.production' : '.env.development')
abstract class Env {
  static const String googleTrendApiEndpoint = _Env.googleTrendApiEndpoint;
}
