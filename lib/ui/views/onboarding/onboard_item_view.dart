import 'package:flutter/material.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:mum_health/ui/common/app_colors.dart';

class OnboardItemView extends StatelessWidget {
  final int index;
  final int pageCount;
  final VoidCallback onGetStarted;

  const OnboardItemView(this.index, {this.pageCount = 4, required this.onGetStarted, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCarousel(),
        const SizedBox(height: 24),
        Text(
          _getTitleText(),
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: AppColors.text, fontSize: 22, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 24),
        Text(
          _getSubtitleText(),
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              height: 1.5,
              fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 24),

        if(index == pageCount - 1)
          MaterialButton(
          onPressed: onGetStarted,
          minWidth: double.maxFinite,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColors.primary,
          textColor: Colors.white,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Text(
              S.current.getStarted,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
        )
      ],
    );
  }

  _buildCarousel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < pageCount; i++)
          Container(
            width: index == i ? 15 : 6.0,
            height: 6.0,
            margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
            decoration: BoxDecoration(
              borderRadius: i == index ? BorderRadius.circular(7) : null,
              shape: i == index ? BoxShape.rectangle : BoxShape.circle,
              color: i == index
                  ? i % 2 == 0
                      ? AppColors.accentMainOne
                      : AppColors.primary
                  : AppColors.defaultCarousel,
            ),
          )
      ],
    );
  }

  _getTitleText() {
    switch (index) {
      case 0:
        return S.current.onboardHeadingOne;
      case 1:
        return S.current.onboardHeadingTwo;
      case 2:
        return S.current.onboardHeadingThree;
      case 3:
        return S.current.onboardHeadingFour;
      default:
        return S.current.onboardHeadingOne;
    }
  }

  _getSubtitleText() {
    switch (index) {
      case 0:
        return S.current.onboardDescOne;
      case 1:
        return S.current.onboardDescTwo;
      case 2:
        return S.current.onboardDescThree;
      case 3:
        return S.current.onboardDescFour;
      default:
        return S.current.onboardDescOne;
    }
  }
}
