import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tasks/common_widgets/async_value_ui.dart';
import 'package:my_tasks/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:my_tasks/routes/routes.dart';
import 'package:my_tasks/utils/utils.dart';

import '../widgets/widgets.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<RegisterScreen> {
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
                AuthTitle('Create your account'),
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
                  text: 'Register',
                  onPressed: createUser,
                  isLoading: state.isLoading,
                ),
                AppSpacer.vertical(10),
                AuthRedirectText(
                  text: 'Already have an account?',
                  redirectText: 'Sign in',
                  redirectRouteName: AppRoutes.signIn.name,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createUser() {
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
          .createUser(email: email, password: password);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
