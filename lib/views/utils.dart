// ignore_for_file: public_member_api_docs, sort_constructors_first
// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';
import 'dart:convert';

import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title;
  final DateTime dateFrom;
  final DateTime dateTo;
  final bool isAllDay;
  final String state;

  const Event({
    required this.title,
    required this.dateFrom,
    required this.dateTo,
    this.isAllDay = false,
    this.state = 'Chưa thực hiện',
  });

  @override
  String toString() => 'Event(title: $title)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(covariant Event other) {
    if (identical(this, other)) return true;

    return other.title == title;
  }

  @override
  int get hashCode => title.hashCode;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final Map<DateTime, List<Event>> _kEventSource = {}
  ..addAll({
    kToday: [
      Event(
        title: 'Test 1',
        dateFrom: DateTime.now(),
        dateTo: DateTime.now(),
      ),
      Event(
        title: 'Test 2',
        dateFrom: DateTime.now(),
        dateTo: DateTime.now(),
      ),
    ],
  })
  ..update(
    kToday,
    (existingEvents) => (existingEvents +
            [
              Event(
                title: 'Test 3',
                dateFrom: DateTime.now(),
                dateTo: DateTime.now(),
              ),
            ])
        .toList(),
  )
  ..update(
    kToday,
    (existingEvents) => (existingEvents +
            [
              Event(
                title: 'Test 4',
                dateFrom: DateTime.now(),
                dateTo: DateTime.now(),
              ),
            ])
        .toList(),
  );

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kTodayNow = DateTime.now();
final kToday = DateTime(kTodayNow.year, kTodayNow.month, kTodayNow.day);

final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
