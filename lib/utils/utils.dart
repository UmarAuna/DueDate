import 'package:another_flushbar/flushbar.dart';
import 'package:due_date_new/utils/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

final log = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 75,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);

const _snackBarDisplayDuration = Duration(milliseconds: 5000);

showCustomToast(
  String message, /* BuildContext? context, */ {
  IconData icon = Icons.check_circle,
  Color iconColor = Colors.white,
  Color textColor = Colors.white,
  Color backgroundColor = AppColors.primaryColor,
  double iconSize = 20.0,
  double textSize = 13.0,
  bool showIcon = false,
  FlushbarPosition flushbarPosition = FlushbarPosition.TOP,
}) {
  final context = Get.context;
  if (context == null) {
    return;
  }
  Flushbar(
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showIcon)
          Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Text(message,
              style: TextStyle(
                  fontSize: textSize,
                  fontFamily: 'General Sans',
                  fontWeight: FontWeight.w400,
                  color: textColor)),
        ),
      ],
    ),
    duration: const Duration(seconds: 4),
    shouldIconPulse: false,
    flushbarPosition: flushbarPosition,
    backgroundColor: backgroundColor,
  ).show(context);
}

showToast(
  String message, {
  ToastGravity gravity = ToastGravity.CENTER,
  Toast length = Toast.LENGTH_LONG,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: length,
    gravity: gravity,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColors.primaryColor,
    textColor: AppColors.white,
    fontSize: 16.0,
  );
}

void showToastBottom(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColors.primaryColor,
    textColor: AppColors.white,
    fontSize: 16.0,
  );
}

showSnackBarCustom(String message, [Duration? duration, BuildContext? ctx]) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: duration ?? _snackBarDisplayDuration,
    action: SnackBarAction(
      label: 'Close',
      textColor: AppColors.white,
      onPressed: () {},
    ),
  );

  try {
    ScaffoldMessenger.of(ctx ?? Get.context!).showSnackBar(snackBar);
  } catch (error) {
    log.i('Snatch bar error: $error');
  }
}

void showSnackBar(String? text, [Duration? duration, BuildContext? context]) {
  if (text == null) return;
  ScaffoldMessenger.of(context ?? Get.context!)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: AppColors.primaryColor,
        duration: duration ?? _snackBarDisplayDuration,
        action: SnackBarAction(
          label: 'Close',
          textColor: AppColors.white,
          onPressed: () {},
        ),
      ),
    );
}

Future<void> goTo(BuildContext context, String screen,
    {Object? arguments}) async {
  try {
    await Navigator.pushNamed(
      context,
      screen,
      arguments: arguments,
    );
  } catch (e) {
    log.e('Navigation Error: ${e.toString()}');
  }
}

Future unNamedGoTo(BuildContext context, Widget screen) async {
  try {
    return await Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (BuildContext context) => screen),
    );
  } catch (e) {
    log.e('Navigation Error: ${e.toString()}');
  }
}

void goBack(BuildContext context, {int count = 1}) {
  try {
    for (var i = 1; i <= count; i++) {
      Navigator.pop(context);
    }
  } catch (e) {
    log.e('Navigation Error: ${e.toString()}');
  }
}

void popThenGoTo(BuildContext context, String screen,
    {Object? arguments, int count = 1}) {
  try {
    goBack(context, count: count);
    goTo(context, screen, arguments: arguments);
  } catch (e) {
    log.e('Navigation Error: ${e.toString()}');
  }
}

enum Level { debug, info, warning, error, wtf }

void logDebug(String message, {Level level = Level.info}) {
  if (kDebugMode) {
    switch (level) {
      case Level.debug:
        log.d(message);
        break;
      case Level.info:
        log.i(message);
        break;
      case Level.warning:
        log.w(message);
        break;
      case Level.error:
        log.e(message);
        break;
      default:
        log.d(message);
    }
  }
}
