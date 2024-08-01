/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class BannerModel extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  BannerModel._({
    int? id,
    this.isVisible,
    this.order,
    this.type,
    this.imagePath,
    this.title,
    this.url,
    this.desc,
  }) : super(id);

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

  static final t = BannerModelTable();

  static const db = BannerModelRepository._();

  int? isVisible;

  int? order;

  int? type;

  String? imagePath;

  String? title;

  String? url;

  String? desc;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static BannerModelInclude include() {
    return BannerModelInclude._();
  }

  static BannerModelIncludeList includeList({
    _i1.WhereExpressionBuilder<BannerModelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BannerModelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BannerModelTable>? orderByList,
    BannerModelInclude? include,
  }) {
    return BannerModelIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BannerModel.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(BannerModel.t),
      include: include,
    );
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

class BannerModelTable extends _i1.Table {
  BannerModelTable({super.tableRelation}) : super(tableName: 'banner_model') {
    isVisible = _i1.ColumnInt(
      'isVisible',
      this,
    );
    order = _i1.ColumnInt(
      'order',
      this,
    );
    type = _i1.ColumnInt(
      'type',
      this,
    );
    imagePath = _i1.ColumnString(
      'imagePath',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    url = _i1.ColumnString(
      'url',
      this,
    );
    desc = _i1.ColumnString(
      'desc',
      this,
    );
  }

  late final _i1.ColumnInt isVisible;

  late final _i1.ColumnInt order;

  late final _i1.ColumnInt type;

  late final _i1.ColumnString imagePath;

  late final _i1.ColumnString title;

  late final _i1.ColumnString url;

  late final _i1.ColumnString desc;

  @override
  List<_i1.Column> get columns => [
        id,
        isVisible,
        order,
        type,
        imagePath,
        title,
        url,
        desc,
      ];
}

class BannerModelInclude extends _i1.IncludeObject {
  BannerModelInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => BannerModel.t;
}

class BannerModelIncludeList extends _i1.IncludeList {
  BannerModelIncludeList._({
    _i1.WhereExpressionBuilder<BannerModelTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BannerModel.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => BannerModel.t;
}

class BannerModelRepository {
  const BannerModelRepository._();

  Future<List<BannerModel>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BannerModelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BannerModelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BannerModelTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<BannerModel>(
      where: where?.call(BannerModel.t),
      orderBy: orderBy?.call(BannerModel.t),
      orderByList: orderByList?.call(BannerModel.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<BannerModel?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BannerModelTable>? where,
    int? offset,
    _i1.OrderByBuilder<BannerModelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BannerModelTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<BannerModel>(
      where: where?.call(BannerModel.t),
      orderBy: orderBy?.call(BannerModel.t),
      orderByList: orderByList?.call(BannerModel.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<BannerModel?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<BannerModel>(
      id,
      transaction: transaction,
    );
  }

  Future<List<BannerModel>> insert(
    _i1.Session session,
    List<BannerModel> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<BannerModel>(
      rows,
      transaction: transaction,
    );
  }

  Future<BannerModel> insertRow(
    _i1.Session session,
    BannerModel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<BannerModel>(
      row,
      transaction: transaction,
    );
  }

  Future<List<BannerModel>> update(
    _i1.Session session,
    List<BannerModel> rows, {
    _i1.ColumnSelections<BannerModelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<BannerModel>(
      rows,
      columns: columns?.call(BannerModel.t),
      transaction: transaction,
    );
  }

  Future<BannerModel> updateRow(
    _i1.Session session,
    BannerModel row, {
    _i1.ColumnSelections<BannerModelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<BannerModel>(
      row,
      columns: columns?.call(BannerModel.t),
      transaction: transaction,
    );
  }

  Future<List<BannerModel>> delete(
    _i1.Session session,
    List<BannerModel> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BannerModel>(
      rows,
      transaction: transaction,
    );
  }

  Future<BannerModel> deleteRow(
    _i1.Session session,
    BannerModel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BannerModel>(
      row,
      transaction: transaction,
    );
  }

  Future<List<BannerModel>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BannerModelTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<BannerModel>(
      where: where(BannerModel.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BannerModelTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BannerModel>(
      where: where?.call(BannerModel.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
