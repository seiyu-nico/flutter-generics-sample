// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/services.dart';

// Project imports:
import 'package:flutter_generics_sample/entities/entity.dart';
import 'package:flutter_generics_sample/repositories/repository.dart';

abstract class AssetRepository<T extends Entity>
    with Repository<T, AssetQuery> {
  String get path;
  String base = 'assets/json';

  @override
  Future<List<Map<String, dynamic>>> get(AssetQuery query) async {
    final String jsonString = await rootBundle.loadString(query.assetPath);
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((data) => data as Map<String, dynamic>).toList();
  }

  Future<List<T>> all() async {
    // MEMO: 本来はAPIからデータを取得するが、今回はassetsから取得する
    var dataList = await get(AssetQuery(assetPath: "$base/$path"));
    List<T> list = dataList.map((data) => fromJson(data)).toList();

    print("runtimeType is ${list.runtimeType}");
    return dataList.map((data) => fromJson(data)).toList();
  }

  Future<T> find(id) async {
    // MEMO: 本来はAPIからデータを取得するが、今回はassetsから取得する
    var dataList = await get(AssetQuery(assetPath: "$base/$path"));
    List<T> list = dataList.map((data) => fromJson(data)).toList();
    // MEMO: 本来はAPIから1件しか帰ってこないがここではassetから取得しているので、今回はidをそのままindexとして扱う
    T data = list[id];

    print("runtimeType is ${data.runtimeType}");
    return data;
  }
}
