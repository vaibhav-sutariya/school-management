import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/routes/app_router.dart';
import '../../../../../../cubit/theme_cubit.dart';
import 'login_tab_switcher.dart';

class LoginFormSheet extends StatefulWidget {
  const LoginFormSheet({super.key});

  @override
  State<LoginFormSheet> createState() => _LoginFormSheetState();
}

class _LoginFormSheetState extends State<LoginFormSheet> {
  final ValueNotifier<int> _tabNotifier = ValueNotifier<int>(0);
  final TextEditingController _inputController = TextEditingController();

  @override
  void dispose() {
    _tabNotifier.dispose();
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Welcome Back',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: context.colors.primary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Please sign in to your account',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          LoginTabSwitcher(selectedIndexNotifier: _tabNotifier),

          const SizedBox(height: 32),

          Text(
            'LOGIN CREDENTIALS',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: context.colors.primary,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 12),

          ValueListenableBuilder<int>(
            valueListenable: _tabNotifier,
            builder: (context, index, _) {
              return Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F6F9),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
                ),
                child: TextField(
                  controller: _inputController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      index == 0
                          ? Icons.phone_android_rounded
                          : Icons.email_rounded,
                      color: const Color(0xFF5C6BC0), // Reference blue-ish
                    ),
                    hintText: index == 0 ? 'Phone Number' : 'School Email',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 24),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Trouble logging in?',
                style: TextStyle(
                  color: Color(0xFF0D078B),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const Spacer(), // Push content up, button to bottom area if needed or just space

          SizedBox(
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                if (_tabNotifier.value == 0) {
                  // Phone Number -> Open OTP Verification
                  context.router.push(const VerificationRoute());
                } else {
                  // Email Address -> Open Password Login
                  // Assuming the email was entered
                  final email = _inputController.text.isNotEmpty
                      ? _inputController.text
                      : 'john.doe@school.edu'; // Fallback or empty logic

                  context.router.push(PasswordLoginRoute(email: email));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D078B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 2,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Terms & Privacy
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              children: [
                const TextSpan(
                  text: 'By continuing, you agree to Elite Academy\'s\n',
                ),
                TextSpan(
                  text: 'Terms of Service',
                  style: TextStyle(
                    color: Colors.grey[700],
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: ' and '),
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyle(
                    color: Colors.grey[700],
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
