/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class BannerModel implements _i1.SerializableModel {
  BannerModel._({
    this.id,
    this.isVisible,
    this.order,
    this.type,
    this.imagePath,
    this.title,
    this.url,
    this.desc,
  });

  factory BannerModel({
    int? id,
    int? isVisible,
    int? order,
    int? type,
    String? imagePath,
    String? title,
    String? url,
    String? desc,
  }) = _BannerModelImpl;

  factory BannerModel.fromJson(Map<String, dynamic> jsonSerialization) {
    return BannerModel(
      id: jsonSerialization['id'] as int?,
      isVisible: jsonSerialization['isVisible'] as int?,
      order: jsonSerialization['order'] as int?,
      type: jsonSerialization['type'] as int?,
      imagePath: jsonSerialization['imagePath'] as String?,
      title: jsonSerialization['title'] as String?,
      url: jsonSerialization['url'] as String?,
      desc: jsonSerialization['desc'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? isVisible;

  int? order;

  int? type;

  String? imagePath;

  String? title;

  String? url;

  String? desc;

  BannerModel copyWith({
    int? id,
    int? isVisible,
    int? order,
    int? type,
    String? imagePath,
    String? title,
    String? url,
    String? desc,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (isVisible != null) 'isVisible': isVisible,
      if (order != null) 'order': order,
      if (type != null) 'type': type,
      if (imagePath != null) 'imagePath': imagePath,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
      if (desc != null) 'desc': desc,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BannerModelImpl extends BannerModel {
  _BannerModelImpl({
    int? id,
    int? isVisible,
    int? order,
    int? type,
    String? imagePath,
    String? title,
    String? url,
    String? desc,
  }) : super._(
          id: id,
          isVisible: isVisible,
          order: order,
          type: type,
          imagePath: imagePath,
          title: title,
          url: url,
          desc: desc,
        );

  @override
  BannerModel copyWith({
    Object? id = _Undefined,
    Object? isVisible = _Undefined,
    Object? order = _Undefined,
    Object? type = _Undefined,
    Object? imagePath = _Undefined,
    Object? title = _Undefined,
    Object? url = _Undefined,
    Object? desc = _Undefined,
  }) {
    return BannerModel(
      id: id is int? ? id : this.id,
      isVisible: isVisible is int? ? isVisible : this.isVisible,
      order: order is int? ? order : this.order,
      type: type is int? ? type : this.type,
      imagePath: imagePath is String? ? imagePath : this.imagePath,
      title: title is String? ? title : this.title,
      url: url is String? ? url : this.url,
      desc: desc is String? ? desc : this.desc,
    );
  }
}
