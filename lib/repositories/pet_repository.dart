// Project imports:
import 'package:flutter_generics_sample/entities/pet.dart';
import 'package:flutter_generics_sample/repositories/api_repository.dart';
import 'package:flutter_generics_sample/repositories/asset_repository.dart';
import 'package:flutter_generics_sample/repositories/repository.dart';

// // Assetの場合
// class PetRepository extends AssetRepository<Pet>
//     with Repository<Pet, AssetQuery> {
//   @override
//   final Pet Function(Map<String, dynamic>) fromJson = Pet.fromJson;

//   @override
//   final String path = 'pets.json';
// }

// Apiの場合
class PetRepository extends ApiRepository<Pet> with Repository<Pet, ApiQuery> {
  @override
  final Pet Function(Map<String, dynamic>) fromJson = Pet.fromJson;

  @override
  final String path = '/pets';
}
