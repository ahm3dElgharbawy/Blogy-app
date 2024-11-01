import 'package:flutter/material.dart';
import 'package:blog_app/core/constants/images_strings.dart';
import 'package:blog_app/features/onboarding/screens/onboarding/widgets/page_view_item.dart';

class CustomOnboardingPageView extends StatelessWidget {
  const CustomOnboardingPageView(
      {super.key, required this.pageController, this.onPageChanged});
  final PageController pageController;
  final Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: onPageChanged,
      children: const [
        CustomOnboardingPageViewItem(
          image: ImagesStrings.onboarding1,
          title: "Welcome to Blogy",
          description:
              "explore a world of articles. Dive into various topics and join a community of passionate readers and writers",
        ),
        CustomOnboardingPageViewItem(
          image: ImagesStrings.onboarding2,
          title: "Create and Share",
          description:
              "Write articles on any topic you love, add images to make them engaging, and publish them to reach a wider audience.",
        ),
        CustomOnboardingPageViewItem(
          image: ImagesStrings.onboarding3,
          title: "React and Comment",
          description:
              "Interact with other users by reacting to their articles and leaving comments. Build connections, get feedback, and be a part of a vibrant community.",
        ),
      ],
    );
  }
}
