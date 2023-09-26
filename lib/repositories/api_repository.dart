// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/services.dart';

// Project imports:
import 'package:flutter_generics_sample/entities/entity.dart';
import 'package:flutter_generics_sample/repositories/repository.dart';

abstract class ApiRepository<T extends Entity> with Repository<T, ApiQuery> {
  String get path;
  String base = 'https://example.com';

  @override
  Future<List<Map<String, dynamic>>> get(ApiQuery query) async {
    // MEMO: 実際にはAPI経由でデータを取得している
    // http.get(uri)などを使う
    // ここでは簡易的にassetsから取得する
    final className = runtimeType.toString();
    final path = className.replaceAll('Repository', '');
    final pathList = {
      'User': 'users',
      'Pet': 'pets',
    };
    final String jsonString =
        await rootBundle.loadString("assets/json/${pathList[path]}.json");
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((data) => data as Map<String, dynamic>).toList();
  }

  Future<List<T>> all() async {
    var dataList = await get(ApiQuery(uri: Uri.parse("$base$path")));
    List<T> list = dataList.map((data) => fromJson(data)).toList();

    print("runtimeType is ${list.runtimeType}");
    return dataList.map((data) => fromJson(data)).toList();
  }

  Future<T> find(id) async {
    // MEMO: 本来はAPIからデータを取得するが、今回はassetsから取得する
    var dataList = await get(ApiQuery(uri: Uri.parse("$base$path/$id")));
    List<T> list = dataList.map((data) => fromJson(data)).toList();
    // MEMO: 本来はAPIから1件しか帰ってこないがここではassetから取得しているので、今回はidをそのままindexとして扱う
    T data = list[id];

    print("runtimeType is ${data.runtimeType}");
    return data;
  }
}
