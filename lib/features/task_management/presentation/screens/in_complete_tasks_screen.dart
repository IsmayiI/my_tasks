import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InCompleteTasksScreen extends ConsumerWidget {
  const InCompleteTasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: Center(child: Text('InComplete Task Screen')));
  }
}
