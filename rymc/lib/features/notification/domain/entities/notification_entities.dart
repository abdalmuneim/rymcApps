import 'package:equatable/equatable.dart';

class Notification extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? image;
  final String? data;
  final String? getAt;

  Notification({
    this.id,
    this.title,
    this.description,
    this.image,
    this.data,
    this.getAt,
  });
  @override
  List<Object?> get props => [
        id,
        title,
        description,
        image,
        data,
        getAt,
      ];
}
