import 'package:due_date_new/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePageController extends GetxController {
  Rx<DateTime?> lmpDate = Rx<DateTime?>(null);
  RxInt gestationalAge = 0.obs;
  Rx<DateTime> dueDate = DateTime.now().obs;
  final DateFormat _dateFormat = DateFormat('dd MMMM yyyy');
  final DateFormat _dateFormatFullTerm = DateFormat('MMM d, yyyy');

  void pickLMPDate() async {
    final DateTime now = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: Get.context!,
      initialDate: lmpDate.value ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (selectedDate != null && selectedDate != lmpDate.value) {
      //TODO 1 do a check here if its stored get stored data and compute
      // TODO 2 else if date is picked compute it and store/replace the selected date
      lmpDate.value = selectedDate;
      updateResults();
    }
  }

  String getFormattedDate(DateTime? date) {
    return date != null ? _dateFormat.format(date) : 'Select Date';
  }

  String getFormattedDueDate() {
    return dueDate.value != null ? _dateFormat.format(dueDate.value) : 'Pick a date';
  }

  void updateResults() {
    if (lmpDate.value != null) {
      DateTime today = DateTime.now();
      Duration gestationalAgeDuration = today.difference(lmpDate.value!);
      //gestationalAge.value = (gestationalAgeDuration.inDays / 7).floor();
      int totalDays = gestationalAgeDuration.inDays;
      int weeks = totalDays ~/ 7;
      int days = totalDays % 7;

      gestationalAge.value = (weeks * 7) + days;

      dueDate.value = lmpDate.value!
          .add(const Duration(days: 280)); // 280 days is the average length of pregnancy
      logDebug('$gestationalAge');
      logDebug(dueDate.value.toString());
    }
  }

  String getGestationalAge() {
    int weeks = gestationalAge.value ~/ 7;
    int days = gestationalAge.value % 7;

    String weeksString = weeks == 0 ? '' : '$weeks ${weeks == 1 ? 'week' : 'weeks'}';
    String daysString = ' $days ${days == 1 ? 'day' : 'days'}';
    //String daysString = days == 0 ? '' : ' $days ${days == 1 ? 'day' : 'days'}';

    return weeksString + daysString;
  }

  String getTrimester() {
    if (gestationalAge.value >= 1 && gestationalAge.value <= 84) {
      return 'First Trimester';
    } else if (gestationalAge.value >= 85 && gestationalAge.value <= 182) {
      return 'Second Trimester';
    } else if (gestationalAge.value >= 183 && gestationalAge.value <= 280) {
      return 'Third Trimester';
    } else {
      return 'Trimester not determined';
    }
  }

  String getCountdownToDueDate() {
    if (dueDate.value.isAfter(DateTime.now())) {
      Duration remainingTime = dueDate.value.difference(DateTime.now());
      int remainingWeeks = (remainingTime.inDays / 7).floor();
      int remainingDays = remainingTime.inDays % 7;

      String weeksString =
          remainingWeeks == 0 ? '' : '$remainingWeeks ${remainingWeeks == 1 ? 'week' : 'weeks'}';
      String daysString = ' $remainingDays ${remainingDays == 1 ? 'day' : 'days'}';
      //String daysString = remainingDays == 0 ? '' : ' $remainingDays ${remainingDays == 1 ? 'day' : 'days'}';

      return '$weeksString$daysString to go!';
    } else {
      return 'Due date has passed!';
    }
  }

  String getFullTerm() {
    if (lmpDate.value != null && dueDate.value != null) {
      String startDate = _dateFormatFullTerm.format(lmpDate.value!);
      String endDate = _dateFormatFullTerm.format(dueDate.value);

      return '$startDate - $endDate';
    } else {
      return 'Full term not available';
    }
  }

  String getFirstTrimesterDates() {
    if (lmpDate.value != null) {
      DateTime startDate = lmpDate.value!;
      DateTime endDate = lmpDate.value!.add(const Duration(days: 84)); // 12 weeks

      return '${_dateFormatFullTerm.format(startDate)} - ${_dateFormatFullTerm.format(endDate)}';
    } else {
      return 'Trimester dates not available';
    }
  }

  String getSecondTrimesterDates() {
    if (lmpDate.value != null) {
      DateTime startDate = lmpDate.value!.add(const Duration(days: 85)); // 13 weeks
      DateTime endDate = lmpDate.value!.add(const Duration(days: 182)); // 26 weeks

      return '${_dateFormatFullTerm.format(startDate)} - ${_dateFormatFullTerm.format(endDate)}';
    } else {
      return 'Trimester dates not available';
    }
  }

  String getThirdTrimesterDates() {
    if (lmpDate.value != null) {
      DateTime startDate = lmpDate.value!.add(const Duration(days: 183)); // 27 weeks
      DateTime endDate = lmpDate.value!.add(const Duration(days: 280)); // 40 weeks

      return '${_dateFormatFullTerm.format(startDate)} - ${_dateFormatFullTerm.format(endDate)}';
    } else {
      return 'Trimester dates not available';
    }
  }
}
