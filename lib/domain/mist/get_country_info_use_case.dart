import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'package:trender/assets/file_constants.dart';
import 'package:trender/data/model/country_info.dart';

class GetCountryInfoUseCase {
  const GetCountryInfoUseCase();

  Future<List<CountryInfo>> call() {
    final completer = Completer<List<CountryInfo>>();
    rootBundle
        .loadString(countryCodeFile)
        .then((jsonStr) => json.decode(jsonStr) as List)
        .then((list) {
      final info = list
          .map((it) => CountryInfo.fromJson(it as Map<String, dynamic>))
          .toList();
      completer.complete(info);
    });
    return completer.future;
  }
}
