// Project imports:
import 'package:flutter_generics_sample/entities/entity.dart';

class User extends Entity {
  final int id;
  final String givenName;
  final String familyName;

  User({required this.id, required this.givenName, required this.familyName})
      : super();

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        givenName = json['given_name'] as String,
        familyName = json['family_name'] as String;
}
