import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? name;
  final String? phone;
  final String? nationalId;
  final String? createAt;
  final String? fcm;
  final List<User>? member;

  User({
    this.name,
    this.nationalId,
    this.phone,
    this.fcm,
    this.createAt,
    this.member,
  });

  @override
  List<Object?> get props => [
        name,
        phone,
        nationalId,
        createAt,
        fcm,
        member,
      ];
}
