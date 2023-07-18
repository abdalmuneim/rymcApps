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
  String get validName {
    return Intl.message(
      'Your name require',
      name: 'validName',
      desc: '',
      args: [],
    );
  }

  /// `مجمع الرازي ينبع الطبي`
  String get compoundAlrazyMedical {
    return Intl.message(
      'مجمع الرازي ينبع الطبي',
      name: 'compoundAlrazyMedical',
      desc: '',
      args: [],
    );
  }

  /// `بوابتك للحصول على الخدمة المميزة`
  String get yourDoorToGetService {
    return Intl.message(
      'بوابتك للحصول على الخدمة المميزة',
      name: 'yourDoorToGetService',
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

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Send validate code`
  String get sendValidateCode {
    return Intl.message(
      'Send validate code',
      name: 'sendValidateCode',
      desc: '',
      args: [],
    );
  }

  /// `رقم التحقق خطاء`
  String get validateCodeNumber {
    return Intl.message(
      'رقم التحقق خطاء',
      name: 'validateCodeNumber',
      desc: '',
      args: [],
    );
  }

  /// `رمز التحقق`
  String get verificationCode {
    return Intl.message(
      'رمز التحقق',
      name: 'verificationCode',
      desc: '',
      args: [],
    );
  }

  /// `تحقق`
  String get verification {
    return Intl.message(
      'تحقق',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `هذا الحقل مطلوب`
  String get requiredField {
    return Intl.message(
      'هذا الحقل مطلوب',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `الاسم الثلاثي`
  String get name {
    return Intl.message(
      'الاسم الثلاثي',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `رقم الهوية الوطنية`
  String get nationalID {
    return Intl.message(
      'رقم الهوية الوطنية',
      name: 'nationalID',
      desc: '',
      args: [],
    );
  }

  /// `Continuo`
  String get continuo {
    return Intl.message(
      'Continuo',
      name: 'continuo',
      desc: '',
      args: [],
    );
  }

  /// `تحقق من جميع العقول`
  String get checkAllFields {
    return Intl.message(
      'تحقق من جميع العقول',
      name: 'checkAllFields',
      desc: '',
      args: [],
    );
  }

  /// `اهلا`
  String get welcome {
    return Intl.message(
      'اهلا',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `تمكنك هذه العضوية من الحصول على مميزات فريدة لك ولافراد أسرتك `
  String get homeTitle {
    return Intl.message(
      'تمكنك هذه العضوية من الحصول على مميزات فريدة لك ولافراد أسرتك ',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  /// `اهلا عميل التميز`
  String get welcomeClient {
    return Intl.message(
      'اهلا عميل التميز',
      name: 'welcomeClient',
      desc: '',
      args: [],
    );
  }

  /// `أفراد العائلة`
  String get familyMembers {
    return Intl.message(
      'أفراد العائلة',
      name: 'familyMembers',
      desc: '',
      args: [],
    );
  }

  /// `أضف أفراد أسرتك`
  String get addFamilyMember {
    return Intl.message(
      'أضف أفراد أسرتك',
      name: 'addFamilyMember',
      desc: '',
      args: [],
    );
  }

  /// `تعديل أفراد أسرتك`
  String get editFamilyFromMember {
    return Intl.message(
      'تعديل أفراد أسرتك',
      name: 'editFamilyFromMember',
      desc: '',
      args: [],
    );
  }

  /// `عميل التميز`
  String get greatClint {
    return Intl.message(
      'عميل التميز',
      name: 'greatClint',
      desc: '',
      args: [],
    );
  }

  /// `أضف فرد أخر من الأسرة`
  String get addAnotherFamilyMember {
    return Intl.message(
      'أضف فرد أخر من الأسرة',
      name: 'addAnotherFamilyMember',
      desc: '',
      args: [],
    );
  }

  /// `إضافة أفراد الأسرة`
  String get additionFamilyMember {
    return Intl.message(
      'إضافة أفراد الأسرة',
      name: 'additionFamilyMember',
      desc: '',
      args: [],
    );
  }

  /// `{member} is Already Exists`
  String memberIsAlreadyExists(Object member) {
    return Intl.message(
      '$member is Already Exists',
      name: 'memberIsAlreadyExists',
      desc: '',
      args: [member],
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

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `إضافة فرد من الأسرة`
  String get addFamilyFromMember {
    return Intl.message(
      'إضافة فرد من الأسرة',
      name: 'addFamilyFromMember',
      desc: '',
      args: [],
    );
  }

  /// `الصفحة الرئيسية`
  String get homePage {
    return Intl.message(
      'الصفحة الرئيسية',
      name: 'homePage',
      desc: '',
      args: [],
    );
  }

  /// `added SuccessFully`
  String get addedSuccessfully {
    return Intl.message(
      'added SuccessFully',
      name: 'addedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Verification code sent see messages`
  String get otpCodeSent {
    return Intl.message(
      'Verification code sent see messages',
      name: 'otpCodeSent',
      desc: '',
      args: [],
    );
  }

  /// `تم انشاء الحساب بنجاح`
  String get createdAccountSuccess {
    return Intl.message(
      'تم انشاء الحساب بنجاح',
      name: 'createdAccountSuccess',
      desc: '',
      args: [],
    );
  }

  /// `مرحبا بعودتك`
  String get welcomeBack {
    return Intl.message(
      'مرحبا بعودتك',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد اتصال بالانترنت تحقق من تفعيله`
  String get noInternetConnection {
    return Intl.message(
      'لا يوجد اتصال بالانترنت تحقق من تفعيله',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد اشعارات حتي الان`
  String get noNotificationYet {
    return Intl.message(
      'لا يوجد اشعارات حتي الان',
      name: 'noNotificationYet',
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
