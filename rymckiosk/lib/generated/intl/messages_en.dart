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

  static String m0(user) => "A call coming from ${user}";

  static String m1(date) =>
      "You will be redirected to the main page within ${date} seconds  ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aCallComingFrom": m0,
        "aboutDoctor": MessageLookupByLibrary.simpleMessage("About Doctor"),
        "addDoctor": MessageLookupByLibrary.simpleMessage("Add Doctor"),
        "ar": MessageLookupByLibrary.simpleMessage("Arabic"),
        "areYouDoctor": MessageLookupByLibrary.simpleMessage("Are you Doctor?"),
        "areYouUser": MessageLookupByLibrary.simpleMessage("Are You User?"),
        "busy": MessageLookupByLibrary.simpleMessage("Busy"),
        "camera": MessageLookupByLibrary.simpleMessage("Camera"),
        "chooseLang": MessageLookupByLibrary.simpleMessage("Chooses Language"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "continueToConsult": MessageLookupByLibrary.simpleMessage(
            "Continue to consult remotely"),
        "doctorName": MessageLookupByLibrary.simpleMessage("Doctor Name"),
        "doctorNotAvailable":
            MessageLookupByLibrary.simpleMessage("Doctor not available"),
        "en": MessageLookupByLibrary.simpleMessage("English"),
        "end": MessageLookupByLibrary.simpleMessage("End"),
        "enter": MessageLookupByLibrary.simpleMessage("Enter"),
        "errorLoaded": MessageLookupByLibrary.simpleMessage("Error loaded"),
        "freeConsultation": MessageLookupByLibrary.simpleMessage(
            "Fast and free medical advice"),
        "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
        "happyToUseOurService": MessageLookupByLibrary.simpleMessage(
            "We are glad you benefited from the service"),
        "imageNotLoaded":
            MessageLookupByLibrary.simpleMessage("Image not Loaded"),
        "imageRequired": MessageLookupByLibrary.simpleMessage("Image required"),
        "introduceYourself":
            MessageLookupByLibrary.simpleMessage("Introduce Yourself"),
        "loadToBackMain": m1,
        "loginAdmin": MessageLookupByLibrary.simpleMessage("Login Admin"),
        "mainPage": MessageLookupByLibrary.simpleMessage("Main Page"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "noDoctorsYetWaitToAdd": MessageLookupByLibrary.simpleMessage(
            "No doctors yet!, Wait to add"),
        "noInternetConnection": MessageLookupByLibrary.simpleMessage(
            "No found Network connection please enable!"),
        "notEXistsPass":
            MessageLookupByLibrary.simpleMessage("Not exists password!"),
        "notFoundFcm": MessageLookupByLibrary.simpleMessage("not found FCM"),
        "online": MessageLookupByLibrary.simpleMessage("Online"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "phoneNotExists":
            MessageLookupByLibrary.simpleMessage("Phone not Exists"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "specialty": MessageLookupByLibrary.simpleMessage("Specialty"),
        "start": MessageLookupByLibrary.simpleMessage("Start"),
        "subTitle": MessageLookupByLibrary.simpleMessage(
            "As a matter of social responsibility, Al-Razi Yanbu Medical Complex provides fast and reliable telemedicine consultation for the benefit of the community"),
        "tackPhoto": MessageLookupByLibrary.simpleMessage("Tack Photo"),
        "thankYou": MessageLookupByLibrary.simpleMessage("Thank you"),
        "thisImportantCommunicationRelatesToTheCorrectConditionOfThe":
            MessageLookupByLibrary.simpleMessage(
                "This important communication relates to the correct condition of the patient"),
        "titleLoadCall": MessageLookupByLibrary.simpleMessage(
            "Please wait, we are\nconnecting you to the doctor..."),
        "valid": MessageLookupByLibrary.simpleMessage("Your name require"),
        "validPassword":
            MessageLookupByLibrary.simpleMessage("Your password require"),
        "validPhone":
            MessageLookupByLibrary.simpleMessage("Your phone number require")
      };
}
