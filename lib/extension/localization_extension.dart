import 'package:flutter/widgets.dart';

import 'package:trender/ext.dart';

extension Localization on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
