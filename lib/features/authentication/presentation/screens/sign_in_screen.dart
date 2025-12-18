import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tasks/routes/routes.dart';
import 'package:my_tasks/utils/size_config.dart';

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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

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
                SizedBox(height: SizeConfig.height(25)),
                AuthTextField(
                  controller: _emailController,
                  hintText: 'Enter email...',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: SizeConfig.height(10)),
                AuthTextField(
                  controller: _passwordController,
                  hintText: 'Enter email...',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                SizedBox(height: SizeConfig.height(15)),
                AuthCheckbox(
                  isChecked: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                SizedBox(height: SizeConfig.height(25)),
                AuthButton(text: 'Sign in', onPressed: () {}),
                SizedBox(height: SizeConfig.height(10)),
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
}
