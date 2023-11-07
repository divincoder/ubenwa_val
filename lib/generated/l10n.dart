// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to a New\n Mothering Experience`
  String get onboardHeadingOne {
    return Intl.message(
      'Welcome to a New\n Mothering Experience',
      name: 'onboardHeadingOne',
      desc: '',
      args: [],
    );
  }

  /// `Now you can understand a lot about your new born, buckle up for an experience you will always long for.`
  String get onboardDescOne {
    return Intl.message(
      'Now you can understand a lot about your new born, buckle up for an experience you will always long for.',
      name: 'onboardDescOne',
      desc: '',
      args: [],
    );
  }

  /// `A Cry with Meaning`
  String get onboardHeadingTwo {
    return Intl.message(
      'A Cry with Meaning',
      name: 'onboardHeadingTwo',
      desc: '',
      args: [],
    );
  }

  /// `Now with great feedbacks, you can understand a lot about your new born cry patter and prepare for common cry peak period.`
  String get onboardDescTwo {
    return Intl.message(
      'Now with great feedbacks, you can understand a lot about your new born cry patter and prepare for common cry peak period.',
      name: 'onboardDescTwo',
      desc: '',
      args: [],
    );
  }

  /// `Analytical Insight`
  String get onboardHeadingThree {
    return Intl.message(
      'Analytical Insight',
      name: 'onboardHeadingThree',
      desc: '',
      args: [],
    );
  }

  /// `Be your baby’s doctor by viewing great insight and analysis; you get to see how your baby cry activity varies in terms of duration and frequency to help you make good decisions`
  String get onboardDescThree {
    return Intl.message(
      'Be your baby’s doctor by viewing great insight and analysis; you get to see how your baby cry activity varies in terms of duration and frequency to help you make good decisions',
      name: 'onboardDescThree',
      desc: '',
      args: [],
    );
  }

  /// `Happy Mom\n Happy Home`
  String get onboardHeadingFour {
    return Intl.message(
      'Happy Mom\n Happy Home',
      name: 'onboardHeadingFour',
      desc: '',
      args: [],
    );
  }

  /// `Reduce you baby crying time whilst getting your schedule back together by planning for time of cry activity and time of quite.`
  String get onboardDescFour {
    return Intl.message(
      'Reduce you baby crying time whilst getting your schedule back together by planning for time of cry activity and time of quite.',
      name: 'onboardDescFour',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Show me How`
  String get showMeHow {
    return Intl.message(
      'Show me How',
      name: 'showMeHow',
      desc: '',
      args: [],
    );
  }

  /// `Please wait while we\ngather your Baby’s data...`
  String get pleaseWaitWhileWeGatherBayData {
    return Intl.message(
      'Please wait while we\ngather your Baby’s data...',
      name: 'pleaseWaitWhileWeGatherBayData',
      desc: '',
      args: [],
    );
  }

  /// `Cry Records`
  String get cryRecords {
    return Intl.message(
      'Cry Records',
      name: 'cryRecords',
      desc: '',
      args: [],
    );
  }

  /// `Number \nof Cry Episode`
  String get numberOfCryEpisode {
    return Intl.message(
      'Number \nof Cry Episode',
      name: 'numberOfCryEpisode',
      desc: '',
      args: [],
    );
  }

  /// `Longest \nCry Duration`
  String get longestCryDuration {
    return Intl.message(
      'Longest \nCry Duration',
      name: 'longestCryDuration',
      desc: '',
      args: [],
    );
  }

  /// `Cumulative \nCry Duration`
  String get cumulativeCryDuration {
    return Intl.message(
      'Cumulative \nCry Duration',
      name: 'cumulativeCryDuration',
      desc: '',
      args: [],
    );
  }

  /// `{value} better than yesterday`
  String betterThanYesterday(Object value) {
    return Intl.message(
      '$value better than yesterday',
      name: 'betterThanYesterday',
      desc: '',
      args: [value],
    );
  }

  /// `{value} worst than yesterday`
  String worstThanYesterday(Object value) {
    return Intl.message(
      '$value worst than yesterday',
      name: 'worstThanYesterday',
      desc: '',
      args: [value],
    );
  }

  /// `Hourly Breakdown`
  String get hourlyBreakdown {
    return Intl.message(
      'Hourly Breakdown',
      name: 'hourlyBreakdown',
      desc: '',
      args: [],
    );
  }

  /// `Daily Challenge`
  String get dailyChallenge {
    return Intl.message(
      'Daily Challenge',
      name: 'dailyChallenge',
      desc: '',
      args: [],
    );
  }

  /// `Next Predicted Cry`
  String get nextPredictedCry {
    return Intl.message(
      'Next Predicted Cry',
      name: 'nextPredictedCry',
      desc: '',
      args: [],
    );
  }

  /// `Set Alarm`
  String get setAlarm {
    return Intl.message(
      'Set Alarm',
      name: 'setAlarm',
      desc: '',
      args: [],
    );
  }

  /// `Today's Overview`
  String get todaysOverview {
    return Intl.message(
      'Today\'s Overview',
      name: 'todaysOverview',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
