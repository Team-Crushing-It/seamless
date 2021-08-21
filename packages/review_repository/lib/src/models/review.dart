import 'dart:convert';

import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final String user;
  final String description;
  final String date;
  Review({
    this.user = '',
    this.description = '',
    this.date = '',
  });

  Review copyWith({
    String? user,
    String? description,
    String? date,
  }) {
    return Review(
      user: user ?? this.user,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'description': description,
      'date': date,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      user: map['user'],
      description: map['description'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) => Review.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [user, description, date];
}
