import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rymckiosk/common/app_constant/app_constants.dart';
import 'package:rymckiosk/generated/l10n.dart';

enum ValidationType {
  phone,
  appName,
  cardNumber,
  notEmpty,
  email,
  ipAddress,
  password,
  validationCode
}

class AppValidator {
  static FilteringTextInputFormatter priceValueOnly() {
    return FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'));
  }

  static String? validateFields(
    String? value,
    ValidationType fieldType,
    BuildContext context, {
    int? length,
  }) {
    if (value == null) {
      return S.of(context).valid;
    } else if (fieldType == ValidationType.phone) {
      if (value.length != AppConstants.phoneLength) {
        return S.of(context).validPhone;
      }
    } else if (fieldType == ValidationType.notEmpty) {
      if (value.trim().isEmpty || value.isEmpty) {
        return S.of(context).valid;
      }
    }
    return null;
  }
}
