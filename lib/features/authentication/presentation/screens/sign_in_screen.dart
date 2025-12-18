import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_tasks/routes/routes.dart';
import 'package:my_tasks/utils/app_styles.dart';
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
            left: SizeConfig.getProportionateWidth(10),
            right: SizeConfig.getProportionateWidth(10),
            top: SizeConfig.getProportionateHeight(50),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Sign in to your account',
                  style: AppStyles.titleTextStyle,
                ),
                SizedBox(height: SizeConfig.getProportionateHeight(25)),
                CommonTextField(
                  controller: _emailController,
                  hintText: 'Enter email...',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: SizeConfig.getProportionateHeight(10)),
                CommonTextField(
                  controller: _passwordController,
                  hintText: 'Enter email...',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                SizedBox(height: SizeConfig.getProportionateHeight(15)),
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      'I agree with policy and terms',
                      style: AppStyles.normalTextStyle,
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.getProportionateHeight(25)),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      SizeConfig.getProportionateHeight(50),
                    ),
                  ),
                  child: Text(
                    'Sign in',
                    style: AppStyles.normalTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.getProportionateHeight(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: AppStyles.normalTextStyle,
                    ),
                    SizedBox(width: SizeConfig.getProportionateWidth(5)),
                    GestureDetector(
                      onTap: () {
                        context.goNamed(AppRoutes.register.name);
                      },
                      child: Text(
                        'Register',
                        style: AppStyles.normalTextStyle.copyWith(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
