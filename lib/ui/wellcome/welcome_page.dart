import 'package:flutter/material.dart';
import 'package:helloword/components/custom_button.dart';
import 'package:helloword/constants/app_colors.dart';
import 'package:helloword/ui/login/login.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFF121212),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            _buildTitleWelcomePage(),
            const Spacer(),
            _buildGroupButtonBottom(context),
          ],
        ),
      ),
    );


  }

  Widget _buildTitleWelcomePage() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 42, vertical: 139),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 26),
            child: const Text(
              "Welcome to Up Todo",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: const Text(
              "Please login to your account or create new account to continue",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Lato",
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGroupButtonBottom(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 54),
      child: Column(
        children: [
          _buildBtnLogin(context),
          _buildBtnRegister(),
        ],
      ),
    );
  }

  Widget _buildBtnLogin(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        child: CustomButton(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(6),
          text: "Login",
          textColor: Colors.white.withOpacity(0.87),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Login()));
          },
        ),
      ),
    );
  }

  Widget _buildBtnRegister() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        child: CustomButton(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          text: "Create a Account",
          border: const BorderSide(color: AppColors.primaryColor, width: 2),
          textColor: Colors.white.withOpacity(0.87),
          onPressed: () {
          },
        ),
      ),
    );
  }

}
