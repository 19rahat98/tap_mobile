import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tapme/common/constants/global_duration_constant.dart';
import 'package:tapme/common/constants/global_number_constant.dart';
import 'package:tapme/common/constants/global_taraslate_constant.dart';
import 'package:tapme/config/theme.dart';
import 'package:tapme/l10n/l10n.dart';

/// расширение для работы с датами
extension SelectDateExtension on BuildContext {
  /// показывает диалог для выбора даты в зависимости от даты
  /// [onSelected] - обратный вызов при выборе даты
  /// [initialDate] - выбранная дата по умолчанию
  void showSelectDate({
    Function(DateTime)? onSelected,
    DateTime? initialDate,
  }) {
    if (Platform.isAndroid) {
      _showMaterialDatePicker(
        onSelected: onSelected!,
        initialDate: initialDate!,
      );
    } else {
      _showCupertinoDatePicker(
        onSelected: onSelected!,
        initialDate: initialDate!,
      );
    }
  }

  /// выбрать время
  /// [initialTime] - диапозон времени по умолчанию
  /// [onSelectTime] - обратный вызов при выборе времени
  Future<void> showSelectTime({
    Duration initialTime = GlobalDurationConstant.selectTimeDuration,
    required ValueChanged<Duration> onSelectTime,
  }) async {
    if (Platform.isAndroid) {
      final value = await showTimePicker(
          context: this,
          initialTime: TimeOfDay(
            hour: initialTime.inHours,
            minute: initialTime.inMinutes,
          ));
      if (value != null) {
        final duration = Duration(hours: value.hour, minutes: value.minute);
        onSelectTime.call(duration);
      }
    } else {
      _showCupertinoTimePicker(
        initialTime: initialTime,
        onSelectTime: onSelectTime,
      );
    }
  }

  /// показывает Material диалог для выбора даты
  /// [onSelected] - обратный вызов при выборе даты
  /// [initialDate] - выбранная дата по умолчанию
  Future<void> _showMaterialDatePicker({
    required Function(DateTime) onSelected,
    required DateTime initialDate,
  }) async {
    final now = DateTime.now();
    final initialDateTime = initialDate.isBefore(now) ? now : initialDate;
    final picked = await showDatePicker(
        context: this,
        initialDate: initialDateTime,
        firstDate: DateTime.utc(now.year, now.month, now.day),
        lastDate: DateTime(NumberConstant.maxDatePickerYear));
    if (picked != null) {
      onSelected.call(picked);
    }
  }

  /// показывает Cupertino диалог для выбора даты
  /// [onSelectTime] - обратный вызов при выборе времени
  void _showCupertinoTimePicker({
    required Duration initialTime,
    required ValueChanged<Duration> onSelectTime,
  }) {
    var time = initialTime;
    showCupertinoModalBottomSheet<void>(
      context: this,
      builder: (_) {
        return Column(
          children: [
            SizedBox(
              height: 250,
              child: CupertinoTimerPicker(
                initialTimerDuration: initialTime,
                mode: CupertinoTimerPickerMode.hm,
                onTimerDurationChanged: (value) {
                  time = value;
                },
              ),
            ),
            CupertinoButton(
              child: Text(
                l10n.continueText,
                style: AppStyle.semibold.copyWith(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              onPressed: () {
                onSelectTime.call(time);
                Navigator.of(this).pop();
              },
            )
          ],
        );
      },
    );
  }

  /// показывает Cupertino диалог для выбора даты
  /// [onSelected] - обратный вызов при выборе даты
  /// [initialDate] - выбранная дата по умолчанию
  void _showCupertinoDatePicker({
    required Function(DateTime) onSelected,
    required DateTime initialDate,
  }) {
    final now = DateTime.now();
    final initialDateTime = initialDate.isBefore(now) ? now : initialDate;
    var selectedDate = initialDateTime;
    showCupertinoModalBottomSheet<void>(
      context: this,
      builder: (_) => Column(
        children: [
          SizedBox(
            height: 250,
            child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: initialDateTime,
                minimumDate: DateTime.utc(now.year, now.month, now.day),
                maximumDate: DateTime(NumberConstant.maxDatePickerYear),
                onDateTimeChanged: (picked) {
                  selectedDate = picked;
                }),
          ),
          CupertinoButton(
            child: Text(l10n.ok),
            onPressed: () {
              onSelected.call(selectedDate);
              Navigator.of(this).pop();
            },
          )
        ],
      ),
    );
  }
}
