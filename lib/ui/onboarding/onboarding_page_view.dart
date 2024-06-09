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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        // PageView sẽ hiển thị danh sách các trang cho phép tạo ra 1 danh sách trang mà nguươời dùng có thể vuoost qua
        children: const [
          // Truyền vào các widget con mà muốn papge view hển thị
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page1,
          ),
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page2, // Truyền vào với tham số là enum page name
          ),
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page3,
          ),
        ],
      ),
    );
  }
}
