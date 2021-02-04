import 'package:dart_twitter_api/twitter_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:get_it/get_it.dart';

import 'package:WhatIsNew/assets/constants.dart' as c;
import 'core/models/viewmodels/tweet_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<TwitterApi>(
    () => TwitterApi(
      client: TwitterClient(
        consumerKey: dot_env.env[c.twitterApiKey],
        consumerSecret: dot_env.env[c.twitterApiKeySecret],
        token: dot_env.env[c.twitterAccessToken],
        secret: dot_env.env[c.twitterAccessTokenSecret],
      ),
    ),
  );
  locator.registerLazySingleton(() => TweetViewModel());
}
