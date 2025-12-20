import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tasks/utils/app_text_style.dart';

extension AsyncValueUi on AsyncValue {
  void showDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      final message = _errorMessage(error);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          icon: Icon(Icons.error, color: Colors.red, size: 40),
          title: Text('Error', style: AppTextStyle.normal),
          content: Text(message, style: AppTextStyle.normal),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close', style: AppTextStyle.normal),
            ),
          ],
        ),
      );
    }
  }
}

String _errorMessage(Object? error) {
  if (error is FirebaseAuthException) {
    return error.message ?? error.toString();
  } else {
    return error.toString();
  }
}
