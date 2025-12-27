import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tasks/common_widgets/common_widgets.dart';
import 'package:my_tasks/features/authentication/data/auth_repository.dart';
import 'package:my_tasks/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:my_tasks/features/authentication/presentation/widgets/widgets.dart';
import 'package:my_tasks/features/task_management/presentation/widgets/widgets.dart';
import 'package:my_tasks/utils/utils.dart';

class AccountsScreen extends ConsumerWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider)!;

    final state = ref.watch(authControllerProvider);

    ref.listen(authControllerProvider, (previous, next) {
      next.showDialogOnError(context);
    });

    return Scaffold(
      appBar: commonAppBar('Account'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Account Information',
              style: AppTextStyle.title.copyWith(fontSize: 20),
            ),
            const Icon(Icons.account_circle, color: Colors.green, size: 80),
            Text(currentUser.email!),
            SizedBox(height: SizeConfig.height(20)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.width(10)),
              child: AuthButton(
                text: 'Log Out',
                onPressed: ref.read(authControllerProvider.notifier).signOut,
                isLoading: state.isLoading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
