class OnboardingModel {
  //1. onboarding model class -> title, subtitle, index
  //2. create a widget : circular widget with the four babies - changing background on focus baby, shrinking effect
  //3. on index change: rotate the widget, change the center

  final String title;
  final String desc;
  final int index;

  OnboardingModel({required this.title, required this.desc, required this.index});
}
