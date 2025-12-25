import 'package:flutter/material.dart';
import 'package:my_tasks/utils/utils.dart';

PreferredSizeWidget commonAppBar(String title) {
  return AppBar(
    title: Text(title, style: AppTextStyle.title.copyWith(color: Colors.white)),
  );
}
