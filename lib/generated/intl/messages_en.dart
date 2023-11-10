// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(value) => "${value} better than yesterday";

  static String m1(value) => "${value} worst than yesterday";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "betterThanYesterday": m0,
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cryAlert": MessageLookupByLibrary.simpleMessage("Cry Alert"),
        "cryAlertDesc": MessageLookupByLibrary.simpleMessage(
            "Baby should cry any moment from now"),
        "cryRecords": MessageLookupByLibrary.simpleMessage("Cry Records"),
        "cumulativeCryDuration":
            MessageLookupByLibrary.simpleMessage("Cumulative \nCry Duration"),
        "dailyChallenge":
            MessageLookupByLibrary.simpleMessage("Daily Challenge"),
        "getStarted": MessageLookupByLibrary.simpleMessage("Get Started"),
        "hourlyBreakdown":
            MessageLookupByLibrary.simpleMessage("Hourly Breakdown"),
        "logOut": MessageLookupByLibrary.simpleMessage("Log Out"),
        "logOutPrompt": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to log out?"),
        "longestCryDuration":
            MessageLookupByLibrary.simpleMessage("Longest \nCry Duration"),
        "loopAlarmAudio":
            MessageLookupByLibrary.simpleMessage("Loop alarm audio"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "nextPredictedCry":
            MessageLookupByLibrary.simpleMessage("Next Predicted Cry"),
        "numberOfCryEpisode":
            MessageLookupByLibrary.simpleMessage("Number \nof Cry Episode"),
        "onboardDescFour": MessageLookupByLibrary.simpleMessage(
            "Reduce you baby crying time whilst getting your schedule back together by planning for time of cry activity and time of quite."),
        "onboardDescOne": MessageLookupByLibrary.simpleMessage(
            "Now you can understand a lot about your new born, buckle up for an experience you will always long for."),
        "onboardDescThree": MessageLookupByLibrary.simpleMessage(
            "Be your baby’s doctor by viewing great insight and analysis; you get to see how your baby cry activity varies in terms of duration and frequency to help you make good decisions"),
        "onboardDescTwo": MessageLookupByLibrary.simpleMessage(
            "Now with great feedbacks, you can understand a lot about your new born cry patter and prepare for common cry peak period."),
        "onboardHeadingFour":
            MessageLookupByLibrary.simpleMessage("Happy Mom\n Happy Home"),
        "onboardHeadingOne": MessageLookupByLibrary.simpleMessage(
            "Welcome to a New\n Mothering Experience"),
        "onboardHeadingThree":
            MessageLookupByLibrary.simpleMessage("Analytical Insight"),
        "onboardHeadingTwo":
            MessageLookupByLibrary.simpleMessage("A Cry with Meaning"),
        "pleaseWaitWhileWeGatherBayData": MessageLookupByLibrary.simpleMessage(
            "Please wait while we\ngather your Baby’s data..."),
        "previous": MessageLookupByLibrary.simpleMessage("Previous"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "setAlarm": MessageLookupByLibrary.simpleMessage("Set Alarm"),
        "showMeHow": MessageLookupByLibrary.simpleMessage("Show me How"),
        "showNotification":
            MessageLookupByLibrary.simpleMessage("Show notification"),
        "showVolumeMax":
            MessageLookupByLibrary.simpleMessage("System volume max"),
        "sound": MessageLookupByLibrary.simpleMessage("Sound"),
        "todaysOverview":
            MessageLookupByLibrary.simpleMessage("Today\'s Overview"),
        "vibrate": MessageLookupByLibrary.simpleMessage("Vibrate"),
        "worstThanYesterday": m1
      };
}
