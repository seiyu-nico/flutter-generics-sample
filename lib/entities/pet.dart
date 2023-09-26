// Project imports:
import 'package:flutter_generics_sample/entities/entity.dart';

class Pet extends Entity {
  final int id;
  final String name;
  final int age;

  Pet({required this.id, required this.name, required this.age}) : super();

  Pet.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        age = json['age'] as int;
}
