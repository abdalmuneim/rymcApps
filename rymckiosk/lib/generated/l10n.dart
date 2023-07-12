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

  /// `Arabic`
  String get ar {
    return Intl.message(
      'Arabic',
      name: 'ar',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get en {
    return Intl.message(
      'English',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `Fast and free medical advice`
  String get freeConsultation {
    return Intl.message(
      'Fast and free medical advice',
      name: 'freeConsultation',
      desc: '',
      args: [],
    );
  }

  /// `Busy`
  String get busy {
    return Intl.message(
      'Busy',
      name: 'busy',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get online {
    return Intl.message(
      'Online',
      name: 'online',
      desc: '',
      args: [],
    );
  }

  /// `Chooses Language`
  String get chooseLang {
    return Intl.message(
      'Chooses Language',
      name: 'chooseLang',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `As a matter of social responsibility, Al-Razi Yanbu Medical Complex provides fast and reliable telemedicine consultation for the benefit of the community`
  String get subTitle {
    return Intl.message(
      'As a matter of social responsibility, Al-Razi Yanbu Medical Complex provides fast and reliable telemedicine consultation for the benefit of the community',
      name: 'subTitle',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Continue to consult remotely`
  String get continueToConsult {
    return Intl.message(
      'Continue to consult remotely',
      name: 'continueToConsult',
      desc: '',
      args: [],
    );
  }

  /// `Introduce Yourself`
  String get introduceYourself {
    return Intl.message(
      'Introduce Yourself',
      name: 'introduceYourself',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Your phone number require`
  String get validPhone {
    return Intl.message(
      'Your phone number require',
      name: 'validPhone',
      desc: '',
      args: [],
    );
  }

  /// `Your name require`
  String get valid {
    return Intl.message(
      'Your name require',
      name: 'valid',
      desc: '',
      args: [],
    );
  }

  /// `Please wait, we are\nconnecting you to the doctor...`
  String get titleLoadCall {
    return Intl.message(
      'Please wait, we are\nconnecting you to the doctor...',
      name: 'titleLoadCall',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `End`
  String get end {
    return Intl.message(
      'End',
      name: 'end',
      desc: '',
      args: [],
    );
  }

  /// `Thank you`
  String get thankYou {
    return Intl.message(
      'Thank you',
      name: 'thankYou',
      desc: '',
      args: [],
    );
  }

  /// `We are glad you benefited from the service`
  String get happyToUseOurService {
    return Intl.message(
      'We are glad you benefited from the service',
      name: 'happyToUseOurService',
      desc: '',
      args: [],
    );
  }

  /// `You will be redirected to the main page within {date} seconds  `
  String loadToBackMain(Object date) {
    return Intl.message(
      'You will be redirected to the main page within $date seconds  ',
      name: 'loadToBackMain',
      desc: '',
      args: [date],
    );
  }

  /// `Main Page`
  String get mainPage {
    return Intl.message(
      'Main Page',
      name: 'mainPage',
      desc: '',
      args: [],
    );
  }

  /// `No found Network connection please enable!`
  String get noInternetConnection {
    return Intl.message(
      'No found Network connection please enable!',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Login Admin`
  String get loginAdmin {
    return Intl.message(
      'Login Admin',
      name: 'loginAdmin',
      desc: '',
      args: [],
    );
  }

  /// `Your password require`
  String get validPassword {
    return Intl.message(
      'Your password require',
      name: 'validPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get enter {
    return Intl.message(
      'Enter',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Not exists password!`
  String get notEXistsPass {
    return Intl.message(
      'Not exists password!',
      name: 'notEXistsPass',
      desc: '',
      args: [],
    );
  }

  /// `Are you Doctor?`
  String get areYouDoctor {
    return Intl.message(
      'Are you Doctor?',
      name: 'areYouDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Are You User?`
  String get areYouUser {
    return Intl.message(
      'Are You User?',
      name: 'areYouUser',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Tack Photo`
  String get tackPhoto {
    return Intl.message(
      'Tack Photo',
      name: 'tackPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Phone not Exists`
  String get phoneNotExists {
    return Intl.message(
      'Phone not Exists',
      name: 'phoneNotExists',
      desc: '',
      args: [],
    );
  }

  /// `Add Doctor`
  String get addDoctor {
    return Intl.message(
      'Add Doctor',
      name: 'addDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Doctor Name`
  String get doctorName {
    return Intl.message(
      'Doctor Name',
      name: 'doctorName',
      desc: '',
      args: [],
    );
  }

  /// `Image required`
  String get imageRequired {
    return Intl.message(
      'Image required',
      name: 'imageRequired',
      desc: '',
      args: [],
    );
  }

  /// `Specialty`
  String get specialty {
    return Intl.message(
      'Specialty',
      name: 'specialty',
      desc: '',
      args: [],
    );
  }

  /// `About Doctor`
  String get aboutDoctor {
    return Intl.message(
      'About Doctor',
      name: 'aboutDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Image not Loaded`
  String get imageNotLoaded {
    return Intl.message(
      'Image not Loaded',
      name: 'imageNotLoaded',
      desc: '',
      args: [],
    );
  }

  /// `Error loaded`
  String get errorLoaded {
    return Intl.message(
      'Error loaded',
      name: 'errorLoaded',
      desc: '',
      args: [],
    );
  }

  /// `This important communication relates to the correct condition of the patient`
  String get thisImportantCommunicationRelatesToTheCorrectConditionOfThe {
    return Intl.message(
      'This important communication relates to the correct condition of the patient',
      name: 'thisImportantCommunicationRelatesToTheCorrectConditionOfThe',
      desc: '',
      args: [],
    );
  }

  /// `A call coming from {user}`
  String aCallComingFrom(Object user) {
    return Intl.message(
      'A call coming from $user',
      name: 'aCallComingFrom',
      desc: '',
      args: [user],
    );
  }

  /// `not found FCM`
  String get notFoundFcm {
    return Intl.message(
      'not found FCM',
      name: 'notFoundFcm',
      desc: '',
      args: [],
    );
  }

  /// `No doctors yet!, Wait to add`
  String get noDoctorsYetWaitToAdd {
    return Intl.message(
      'No doctors yet!, Wait to add',
      name: 'noDoctorsYetWaitToAdd',
      desc: '',
      args: [],
    );
  }

  /// `Doctor not available`
  String get doctorNotAvailable {
    return Intl.message(
      'Doctor not available',
      name: 'doctorNotAvailable',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
