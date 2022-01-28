import 'package:flutter/foundation.dart';

final int defaultItemsLimit = 50; //TODO set it correctly
final maxTrialDuration = Duration(days: 9999); //TODO set it correctly
final minDatePickerValidation = DateTime(1700);
final maxDatePickerValidation = DateTime(2300);
final minAgePickerValidation = DateTime(1700);
final maxAgePickerValidation = DateTime(2300);
final formAutoSaveDurationSeconds = kDebugMode ? 600000 : 60;

