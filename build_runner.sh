#!/bin/sh

# Workaround for the Hive issue https://github.com/dart-lang/build/issues/2835
cat <<EOF >.dart_tool/flutter_gen/pubspec.yaml
dependencies:
EOF

# Use --delete-conflicting-outputs if necessary
flutter packages pub run build_runner build
