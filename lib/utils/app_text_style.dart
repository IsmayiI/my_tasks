import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_tasks/utils/size_config.dart';

class AppTextStyle {
  static final head = GoogleFonts.mcLaren(
    fontSize: SizeConfig.height(22),
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static final title = GoogleFonts.mcLaren(
    fontSize: SizeConfig.height(18),
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static final normal = GoogleFonts.mcLaren(
    fontSize: SizeConfig.height(12),
    fontWeight: FontWeight.w100,
    color: Colors.black,
  );
}
