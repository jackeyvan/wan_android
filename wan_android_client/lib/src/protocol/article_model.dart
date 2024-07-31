/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class ArticleModel implements _i1.SerializableModel {
  ArticleModel._({
    this.id,
    required this.name,
    this.url,
  });

  factory ArticleModel({
    int? id,
    required String name,
    String? url,
  }) = _ArticleModelImpl;

  factory ArticleModel.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArticleModel(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      url: jsonSerialization['url'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String? url;

  ArticleModel copyWith({
    int? id,
    String? name,
    String? url,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (url != null) 'url': url,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArticleModelImpl extends ArticleModel {
  _ArticleModelImpl({
    int? id,
    required String name,
    String? url,
  }) : super._(
          id: id,
          name: name,
          url: url,
        );

  @override
  ArticleModel copyWith({
    Object? id = _Undefined,
    String? name,
    Object? url = _Undefined,
  }) {
    return ArticleModel(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      url: url is String? ? url : this.url,
    );
  }
}
