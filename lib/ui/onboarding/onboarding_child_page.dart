import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloword/enums/onboarding_page_position.dart';

// Đây là một StatelessWidget dùng để hiển thị giao diện onboarding
class OnboardingChildPage extends StatelessWidget {
  final OnboardingPagePosition onboardingPagePosition;
  // Định nghĩa 1 function
  final VoidCallback nextOnPressed;
  final VoidCallback backOnPressed;
  final VoidCallback skipOnPessed;

  const OnboardingChildPage({
    super.key,
    required this.onboardingPagePosition,
    required this.nextOnPressed,
    required this.backOnPressed,
    required this.skipOnPessed
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Thiết lập màu nền của trang là màu đen (mã màu 0XFF121212)
      backgroundColor: const Color(0XFF121212),
      body: SafeArea(
        child: Column(
          // Sắp xếp các phần tử theo chiều dọc
          children: [
            _buildSkipButton(context),
            // Nút Skip
            _buildOnboardingImage(context),
            // Hình ảnh onboarding
            _buildOnboardingPageControl(context),
            // Điều khiển trang onboarding
            _buildOnboardingTitleAndContent(context),
            // Tiêu đề và nội dung onboarding
            _buildOnboardingNextAndPrevButton(context)
            // Nút Next và Back
          ],
        ),
      ),
    );
  }

  // Hàm xây dựng nút Skip
  Widget _buildSkipButton(BuildContext context) {
    // Tính toán khoảng cách phía trên dựa trên chiều cao của màn hình
    double topMargin = MediaQuery.of(context).size.height * 0.02;

    return Container(
      // Căn chỉnh nút Skip sang trái
      alignment: AlignmentDirectional.centerStart,
      // Thiết lập khoảng cách phía trên
      margin: EdgeInsets.only(top: topMargin),
      child: TextButton(
        onPressed: () {
          skipOnPessed.call(); // Gọi hàm skip từ contructor truyền vào
        }, // Hành động khi bấm nút (hiện tại để trống)
        child: Text(
          "Skip",
          style: TextStyle(
              fontSize: 16,
              fontFamily: "Lato",
              color: Colors.white.withOpacity(0.44)), // Màu chữ với độ mờ
        ),
      ),
    );
  }

  // Hàm xây dựng hình ảnh onboarding
  Widget _buildOnboardingImage(BuildContext context) {
    // Tính toán chiều cao và chiều rộng của hình ảnh dựa trên kích thước màn hình
    double imageHeight = MediaQuery.of(context).size.height * 0.4;
    double imageWidth = MediaQuery.of(context).size.width * 0.7;

    return Image.asset(
      onboardingPagePosition.onboardingPageImage(), // Đường dẫn tới hình ảnh
      height: imageHeight,
      width: imageWidth,
      fit: BoxFit.contain, // Giữ nguyên tỉ lệ hình ảnh
    );
  }

  // Hàm xây dựng điều khiển trang onboarding (các chấm tròn hiển thị trang hiện tại)
  Widget _buildOnboardingPageControl(BuildContext context) {
    // Tạo danh sách các chấm tròn
    final List<Widget> indicators = List.generate(
      3,
      (index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        // Khoảng cách ngang giữa các chấm tròn
        height: 4,
        width: 32,
        decoration: BoxDecoration(
           color: "page${index+1}" == onboardingPagePosition.name ? Colors.white.withOpacity(1) : Colors.white.withOpacity(0.7) , // Màu sắc của chấm tròn với độ mờ
        ),
      ),
    );

    // Tính toán khoảng cách dọc giữa các thành phần
    double verticalMargin = MediaQuery.of(context).size.height * 0.06;

    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Căn giữa các chấm tròn
            children: indicators,
          ),
        ],
      ),
    );
  }

  // Hàm xây dựng tiêu đề và nội dung onboarding
  Widget _buildOnboardingTitleAndContent(BuildContext context) {
    // Tính toán khoảng cách ngang và khoảng cách giữa tiêu đề và nội dung
    double horizontalMargin = MediaQuery.of(context).size.width * 0.1;
    double spacingBetweenTitleAndContent =
        MediaQuery.of(context).size.height * 0.05;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
      // Margin theo chiều dọc
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // Căn giữa các phần tử trong cột
        children: [
          Text(
            onboardingPagePosition.onboardingPageTitle(),
            style: TextStyle(
                color: Colors.white.withOpacity(0.87),
                fontSize: 32,
                fontFamily: "Lato",
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height:
                spacingBetweenTitleAndContent, // Khoảng cách giữa tiêu đề và nội dung
          ),
          Text(
            onboardingPagePosition.onboardingPageDescription(),
            style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 16,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center, // Căn giữa nội dung
          )
        ],
      ),
    );
  }

  // Hàm xây dựng nút Next và Back
  Widget _buildOnboardingNextAndPrevButton(BuildContext context) {
    // Tính toán khoảng cách ngang và khoảng cách phía trên
    double horizontalMargin = MediaQuery.of(context).size.width * 0.06;
    double topMargin = MediaQuery.of(context).size.height * 0.12;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin)
          .copyWith(top: topMargin),
      child: Row(
        children: [
          TextButton(
              onPressed: () {
                backOnPressed();
              },
              // Hành động khi bấm nút Back (hiện tại để trống)
              child: Text(
                "Back",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.44)), // Màu chữ với độ mờ
              )),
          const Spacer(), // Tạo khoảng trống giữa nút Back và nút Next
          ElevatedButton(
              onPressed: () {
                // nextOnPressed.call()  cách 1
                nextOnPressed(); // Cách 2
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8875FF), // Màu nền của nút
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4) // Bo góc nút
                      )),

              // Hành động khi bấm nút Next (hiện tại để trống)
              child: Text(
                 onboardingPagePosition.name == "page3" ? "Get started" : "Next",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.87)), // Màu chữ với độ mờ
              ))
        ],
      ),
    );
  }
}
