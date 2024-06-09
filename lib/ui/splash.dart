import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Đai diện 1 màn hình. Mỗi màn hình cần bọc trong scaffold
      backgroundColor: Color(0XFF121212), // Cách sử dụng mã hex
      body: SafeArea(
        // Bọc code trong Safe Area. Code sẽ được bọc trong SafeArea top và SafeArea
        child: Center( // Bọc các phần tử con ra giữa
          child: Container( // Một box
            child: Column( // Đưa Các phần tử con về dạng cột theo chiều dọc
              mainAxisSize: MainAxisSize.min, //Mặc định column sẽ chiếm hết chiều dọc . MainAxisSize.min, làm cho nó co lại phủ đủ
              children: [
                _buildIconSplash(),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: _buildTextSplash(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconSplash() {
    return   Image.asset(
      "assets/images/splash_icon.png",
      width: 95,
      height: 80,
      fit: BoxFit.contain,
    );
  }

  Widget _buildTextSplash() {
    return const Text(
      "UpTodo",
      style: TextStyle(
          fontSize: 40,
          color: Colors.white,
          fontWeight: FontWeight.bold // in đậm text
      ),
    );
  }

}
