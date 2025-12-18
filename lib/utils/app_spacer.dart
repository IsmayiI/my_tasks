import 'package:flutter/material.dart';

import 'size_config.dart';

class AppSpacer {
  static SizedBox vertical(double value) =>
      SizedBox(height: SizeConfig.height(value));
  static SizedBox horizontal(double value) =>
      SizedBox(width: SizeConfig.width(value));
}
