// Project imports:
import 'package:flutter_generics_sample/entities/entity.dart';

mixin Repository<T extends Entity, Q extends Query> {
  T Function(Map<String, dynamic>) get fromJson;
  Future<List<Map<String, dynamic>>> get(Q query);
}

abstract class Query {
  // 一般的なクエリ情報を定義
}

class ApiQuery extends Query {
  // APIに特有の情報を追加
  ApiQuery({required this.uri});
  final Uri uri;
}

class AssetQuery extends Query {
  // Assetに特有の情報を追加
  AssetQuery({required this.assetPath});
  final String assetPath;
}
