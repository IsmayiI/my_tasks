import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_tasks/routes/routes.dart';
import 'package:my_tasks/utils/app_styles.dart';
import 'package:my_tasks/utils/size_config.dart';

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
                Text('Create your account', style: AppStyles.titleTextStyle),
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
                    'Register',
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
                      "Already have an account?",
                      style: AppStyles.normalTextStyle,
                    ),
                    SizedBox(width: SizeConfig.getProportionateWidth(5)),
                    GestureDetector(
                      onTap: () {
                        context.goNamed(AppRoutes.signIn.name);
                      },
                      child: Text(
                        'Sign in',
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
