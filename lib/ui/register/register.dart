import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloword/components/app_back_btn.dart';
import 'package:helloword/components/custom_button.dart';
import 'package:helloword/components/horizontal_rule_with_text.dart';
import 'package:helloword/constants/app_colors.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    // Sử dụng MediaQuery để lấy kích thước màn hình hiện tại
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const AppBackBtn(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView( // Cho phép cuộn trên thiết bị nhỏ
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Phần tiêu đề "Register"
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 54),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.87),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Form đăng ký
                _buildRegisterForm(),
                const SizedBox(height: 16),
                // Đường ngang có chữ "or"
                const HorizontalRuleWithText(centerText: "or"),
                const SizedBox(height: 20),
                // Các nút đăng ký với Google và Apple
                _buildSocialLoginButtons(),
                const SizedBox(height: 20),
                // Phần footer
                _buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Hàm xây dựng form đăng ký
  Widget _buildRegisterForm() {
    return Column(
      children: [
        _buildTextField("Username", "Enter your Username"),
        const SizedBox(height: 25),
        _buildTextField("Password", "Enter your Password", obscureText: true),
        const SizedBox(height: 25),
        _buildTextField("Confirm Password", "Confirm your Password", obscureText: true),
        const SizedBox(height: 40),
        SizedBox(
          width: double.infinity,
          child: CustomButton(
            text: "Register",
            color: AppColors.primaryColor,
            onPressed: () {
              // Logic đăng ký
            },
          ),
        ),
      ],
    );
  }

  // Hàm xây dựng text field cho form
  Widget _buildTextField(String label, String hintText, {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
        ),
        TextField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            border: const OutlineInputBorder(),
          ),
          obscureText: obscureText,
        ),
      ],
    );
  }

  // Hàm xây dựng các nút đăng ký với Google và Apple
  Widget _buildSocialLoginButtons() {
    return Column(
      children: [
        _buildSocialLoginButton(
          text: 'Register with Google',
          icon: 'assets/images/google_icon.png',
          onPressed: () {
            // Logic đăng ký với Google
          },
        ),
        const SizedBox(height: 20),
        _buildSocialLoginButton(
          text: 'Register with Apple',
          icon: Icons.apple,
          onPressed: () {
            // Logic đăng ký với Apple
          },
        ),
      ],
    );
  }

  // Hàm xây dựng nút đăng ký với icon
  Widget _buildSocialLoginButton({required String text, dynamic icon, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: CustomButton(
        text: text,
        color: Colors.transparent,
        onPressed: onPressed,
        icon: icon is String
            ? Image.asset(icon)
            : Icon(icon, color: Colors.white),
        border: const BorderSide(color: AppColors.primaryColor, width: 2),
      ),
    );
  }

  // Hàm xây dựng footer
  Widget _buildFooter() {
    return const Center(
      child: Text(
        'Don’t have an account? Register',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
