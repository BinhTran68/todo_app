// Class cha quản lý các page con. Di chuyển qua lại giữa page con

import 'package:flutter/material.dart';
import 'package:helloword/enums/onboarding_page_position.dart';

import 'onboarding_child_page.dart';
// stful tạo ra 1 Sateful Widget

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final _pageController = PageController(); // Cung cấp các quyền điều kiển page view

  // Page controller quản lý việc chuyển đổi giữa các trang trong 1 PageView
  //  animateToPage(), jumpToPage() Chuyển đến 1 trang cụ  thể
  // addListener() lắng nghe sự kiện khi trang hiện tại thay đổi
  // thuộc tính page. Tính toán trang hiện tại của Page view
  // initialPage, viewportFraction tùy chỉnh cách mà các trang chuyển dổi hiển thị

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Là màn hình nằm trong Phần màn hình hiển thị k liên quan đến hệ thống
      body: PageView( // Cho phép chuyển màn hình qua lại
        controller: _pageController,
        // PageView sẽ hiển thị danh sách các trang cho phép tạo ra 1 danh sách trang mà nguươời dùng có thể vuoost qua
        children: [
          // Truyền vào các widget con mà muốn papge view hển thị
          OnboardingChildPage( // Gọi class OnboardingChildPage truyền vào những thành phần.
            onboardingPagePosition: OnboardingPagePosition.page1,
            nextOnPressed: () {
              _pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.ease);
            },
            backOnPressed: () {},
            skipOnPessed: () {
              print('Đi đến màn hình wel come 11');
            },
          ),
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page2,
            nextOnPressed: () {
              _pageController.animateToPage(2,
                  duration: Duration(milliseconds: 1000), curve: Curves.ease);
            },
            backOnPressed: () {
              _pageController.animateToPage(0,
                  duration: Duration(milliseconds: 1000), curve: Curves.ease); // Chuyển với  trang animate
            },
            skipOnPessed: () {
              print('Đi đến màn hình wel come');
            }, // Truyền vào với tham số là enum page name
          ),
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page3,
            nextOnPressed: () {
              print('Đi đến màn hình wel come');
            },
            backOnPressed: () {
              _pageController.animateToPage(1,
                  duration: Duration(milliseconds: 1000), curve: Curves.ease);
            },
            skipOnPessed: () {
              print('Đi đến màn hình wel come');
            },
          ),
        ],
      ),
    );
  }
}
