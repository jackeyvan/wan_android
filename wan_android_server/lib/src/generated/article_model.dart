/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class ArticleModel extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  ArticleModel._({
    int? id,
    required this.name,
    this.url,
  }) : super(id);

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

  static final t = ArticleModelTable();

  static const db = ArticleModelRepository._();

  String name;

  String? url;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (url != null) 'url': url,
    };
  }

  static ArticleModelInclude include() {
    return ArticleModelInclude._();
  }

  static ArticleModelIncludeList includeList({
    _i1.WhereExpressionBuilder<ArticleModelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArticleModelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArticleModelTable>? orderByList,
    ArticleModelInclude? include,
  }) {
    return ArticleModelIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArticleModel.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ArticleModel.t),
      include: include,
    );
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

class ArticleModelTable extends _i1.Table {
  ArticleModelTable({super.tableRelation}) : super(tableName: 'article') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    url = _i1.ColumnString(
      'url',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString url;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        url,
      ];
}

class ArticleModelInclude extends _i1.IncludeObject {
  ArticleModelInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => ArticleModel.t;
}

class ArticleModelIncludeList extends _i1.IncludeList {
  ArticleModelIncludeList._({
    _i1.WhereExpressionBuilder<ArticleModelTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ArticleModel.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => ArticleModel.t;
}

class ArticleModelRepository {
  const ArticleModelRepository._();

  Future<List<ArticleModel>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArticleModelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArticleModelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArticleModelTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ArticleModel>(
      where: where?.call(ArticleModel.t),
      orderBy: orderBy?.call(ArticleModel.t),
      orderByList: orderByList?.call(ArticleModel.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<ArticleModel?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArticleModelTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArticleModelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArticleModelTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<ArticleModel>(
      where: where?.call(ArticleModel.t),
      orderBy: orderBy?.call(ArticleModel.t),
      orderByList: orderByList?.call(ArticleModel.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<ArticleModel?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<ArticleModel>(
      id,
      transaction: transaction,
    );
  }

  Future<List<ArticleModel>> insert(
    _i1.Session session,
    List<ArticleModel> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ArticleModel>(
      rows,
      transaction: transaction,
    );
  }

  Future<ArticleModel> insertRow(
    _i1.Session session,
    ArticleModel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ArticleModel>(
      row,
      transaction: transaction,
    );
  }

  Future<List<ArticleModel>> update(
    _i1.Session session,
    List<ArticleModel> rows, {
    _i1.ColumnSelections<ArticleModelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ArticleModel>(
      rows,
      columns: columns?.call(ArticleModel.t),
      transaction: transaction,
    );
  }

  Future<ArticleModel> updateRow(
    _i1.Session session,
    ArticleModel row, {
    _i1.ColumnSelections<ArticleModelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ArticleModel>(
      row,
      columns: columns?.call(ArticleModel.t),
      transaction: transaction,
    );
  }

  Future<List<ArticleModel>> delete(
    _i1.Session session,
    List<ArticleModel> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ArticleModel>(
      rows,
      transaction: transaction,
    );
  }

  Future<ArticleModel> deleteRow(
    _i1.Session session,
    ArticleModel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ArticleModel>(
      row,
      transaction: transaction,
    );
  }

  Future<List<ArticleModel>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArticleModelTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ArticleModel>(
      where: where(ArticleModel.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArticleModelTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ArticleModel>(
      where: where?.call(ArticleModel.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
