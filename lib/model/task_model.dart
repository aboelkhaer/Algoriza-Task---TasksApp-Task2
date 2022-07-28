import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final String? date;
  final String? startTime;
  final String? endTime;
  final int? favorite;
  final int? color;
  final int? remind;
  final String? repeat;
  final int? isDone;
  const Task({
    required this.title,
    this.date,
    this.id,
    this.startTime,
    this.endTime,
    this.favorite,
    this.color,
    this.remind,
    this.repeat,
    this.isDone,
  });

  @override
  List<Object?> get props => [
        title,
        date,
        id,
        startTime,
        endTime,
        color,
        remind,
        favorite,
        repeat,
        isDone,
      ];

  Task copyWith({
    String? title,
    String? date,
    String? startTime,
    String? endTime,
    int? color,
    int? id,
    int? remind,
    String? repeat,
    int? isDone,
    int? favorite,
  }) {
    return Task(
      title: title ?? this.title,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      color: color ?? this.color,
      remind: remind ?? this.remind,
      id: id ?? this.id,
      repeat: repeat ?? this.repeat,
      isDone: isDone ?? this.isDone,
      favorite: favorite ?? this.favorite,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    if (date != null) {
      result.addAll({'date': date});
    }
    if (startTime != null) {
      result.addAll({'startTime': startTime});
    }
    if (endTime != null) {
      result.addAll({'endTime': endTime});
    }
    if (color != null) {
      result.addAll({'color': color});
    }
    if (remind != null) {
      result.addAll({'remind': remind});
    }
    if (repeat != null) {
      result.addAll({'repeat': repeat});
    }
    if (isDone != null) {
      result.addAll({'isDone': isDone});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (favorite != null) {
      result.addAll({'favorite': favorite});
    }

    return result;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      date: map['date'],
      startTime: map['startTime'],
      endTime: map['endTime'],
      color: map['color'],
      id: map['id'],
      remind: map['remind'],
      repeat: map['repeat'],
      isDone: map['isDone'],
      favorite: map['favorite'],
    );
  }
}
