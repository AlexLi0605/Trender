import 'package:get_it/get_it.dart';
import 'core/models/viewmodels/tweet_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => TweetViewModel());
}
