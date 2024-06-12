import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloword/components/app_back_btn.dart';
import 'package:helloword/components/custom_button.dart';
import 'package:helloword/components/horizontal_rule_with_text.dart';
import 'package:helloword/constants/app_colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
          // Thêm khoảng cách xung quanh nội dung
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Container(
                 padding: const EdgeInsets.symmetric(vertical: 54),
                 child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.87) ,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                               ),
               ),
              _buildFormLogin(),
              const SizedBox(height: 16),
              // Expanded widget để lấp đầy không gian còn lại
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const HorizontalRuleWithText(centerText: "or",)),
              _buildLoginGroupButton(),
              _buildLoginGoogleButton(),
              const SizedBox(height: 20), // tạo 1 hộp với height 20
              _buildLoginLAppleButton(),
              Spacer(),
              // Thêm một footer hoặc widget khác
              const Center(
                child: Text(
                  'Don’t have an account? Register',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormLogin() {
    return Column(
      children: [
        const SizedBox(height: 25),
        Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(bottom: 8),
              child: Text("Username",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Enter your Username",
                hintStyle: TextStyle(
                  color: Colors.grey
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
         Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(bottom: 8),
              child: Text("Password",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintStyle: TextStyle(
                    color: Colors.grey
                ),
                hintText: "Enter your Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
          ],
        ),
        const SizedBox(height: 69),
        SizedBox(
          width: double.infinity,
          child:
          CustomButton(
              text: "Login",
              color: AppColors.primaryColor,
              onPressed: () {

              }),
        )
      ],
    );
  }

  Widget _buildLoginGoogleButton() {
    return SizedBox(
      width: double.infinity,
      height: 48 ,
      child: CustomButton(
        text: 'Login with Google',
        color: Colors.transparent,
        onPressed: () {  },
        icon: 'assets/images/google_icon.png',
        border: const BorderSide(color: AppColors.primaryColor, width: 2),
      ),
    );
  }

  Widget _buildLoginLAppleButton() {
    return SizedBox(
      width: double.infinity,
      height: 48 ,
      child: CustomButton(
        icon: _buildAppleIcon(),
        text: 'Login with Apple',
        color: Colors.transparent,
        onPressed: () {  },
        border: const BorderSide(color: AppColors.primaryColor, width: 2),
      ),
    );
  }

  Widget _buildAppleIcon() {
    return Center(
      child: Container(

        decoration: const BoxDecoration(
          color: Colors.grey, // Màu nền của vòng tròn
          shape: BoxShape.circle, // Hình dạng của vòng tròn
        ),
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              // Màu nền của icon bên trong vòng tròn
              shape: BoxShape.circle,
            ),
            child: Container(
              alignment: Alignment.center,
              child: const Icon(
                Icons.apple,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginGroupButton() {
    return Container(

    );
  }
}
