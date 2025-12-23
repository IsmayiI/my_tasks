import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tasks/common_widgets/async_value_ui.dart';
import 'package:my_tasks/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:my_tasks/routes/routes.dart';
import 'package:my_tasks/utils/utils.dart';

import '../widgets/widgets.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);

    ref.listen(authControllerProvider, (previous, next) {
      next.showDialogOnError(context);
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.width(10),
            right: SizeConfig.width(10),
            top: SizeConfig.height(50),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AuthTitle('Sign in to your account'),
                AppSpacer.vertical(25),
                AuthTextField(
                  controller: _emailController,
                  hintText: 'Enter email...',
                  keyboardType: TextInputType.emailAddress,
                ),
                AppSpacer.vertical(10),
                AuthTextField(
                  controller: _passwordController,
                  hintText: 'Enter email...',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                AppSpacer.vertical(15),
                AuthCheckbox(
                  isChecked: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                AppSpacer.vertical(25),
                AuthButton(
                  text: 'Sign in',
                  onPressed: signIn,
                  isLoading: state.isLoading,
                ),
                AppSpacer.vertical(10),
                AuthRedirectText(
                  text: "Don't have an account?",
                  redirectText: 'Register',
                  redirectRouteName: AppRoutes.register.name,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Please enter email and password',
            style: AppTextStyle.normal.copyWith(color: Colors.white),
          ),

          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ref
          .read(authControllerProvider.notifier)
          .signIn(email: email, password: password);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
