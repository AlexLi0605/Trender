import 'package:trender/domain/mist/get_country_info_use_case.dart';

class MistModule {
  const MistModule();

  GetCountryInfoUseCase provideGetCountryInfoUseCase() =>
      const GetCountryInfoUseCase();
}
