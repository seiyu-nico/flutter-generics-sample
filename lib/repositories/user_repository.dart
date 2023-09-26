// Project imports:
import 'package:flutter_generics_sample/entities/user.dart';
import 'package:flutter_generics_sample/repositories/api_repository.dart';
import 'package:flutter_generics_sample/repositories/asset_repository.dart';
import 'package:flutter_generics_sample/repositories/repository.dart';

// // Assetの場合
// class UserRepository extends AssetRepository<User>
//     with Repository<User, AssetQuery> {
//   @override
//   final User Function(Map<String, dynamic>) fromJson = User.fromJson;

//   @override
//   final String path = 'users.json';
// }

// Apiの場合
class UserRepository extends ApiRepository<User>
    with Repository<User, ApiQuery> {
  @override
  final User Function(Map<String, dynamic>) fromJson = User.fromJson;

  @override
  final String path = '/users';
}
