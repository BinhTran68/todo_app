enum OnboardingPagePosition {
  page1,
  page2,
  page3
}


// extension sử dụng để mở rộng tính năng của enum
extension OnboardingPagePositionExtension on OnboardingPagePosition {
  // Trả về image cho 3 page
  String onboardingPageImage() {
    switch(this) {
      case OnboardingPagePosition.page1:
        return "assets/images/onboarding_1.png";
      case OnboardingPagePosition.page2:
        return "assets/images/onboarding_2.png";
      case OnboardingPagePosition.page3:
        return "assets/images/onboarding_3.png";
    }
  }

  String onboardingPageTitle() {
    switch(this) {
      case OnboardingPagePosition.page1:
        return "Manage your tasks";
      case OnboardingPagePosition.page2:
        return "Create daily routine";
      case OnboardingPagePosition.page3:
        return "Organize your tasks";
    }
  }

  String onboardingPageDescription() {
    switch(this) {
      case OnboardingPagePosition.page1:
        return "You can easily manage all of your daily tasks in DoMe for free";
      case OnboardingPagePosition.page2:
        return "In Up todo  you can create your personalized routine to stay productive";
      case OnboardingPagePosition.page3:
        return "You can organize your daily tasks by adding your tasks into separate categories";
    }
  }


}