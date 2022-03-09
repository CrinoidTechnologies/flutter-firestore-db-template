
///
class PathArgs {
  final String key;
  final dynamic value;

  PathArgs(this.key, this.value);

  @override
  String toString() {
    return 'PathArgs{key: $key, value: $value}';
  }
}

class QueryArgs {
  final String key;
  final dynamic value;

  ///set true if want to query with != or not-contains
  final bool negate;

  QueryArgs(this.key, this.value, {this.negate = false});

  @override
  String toString() {
    return 'QueryArgs{key: $key, value: $value}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QueryArgs && (key == other.key);

  @override
  int get hashCode => key.hashCode;
}

class WhereInArgs {
  final String key;
  final List<dynamic> value;

  //If true : whereNotIn will be used instead of whereIn
  final bool negate;

  WhereInArgs(this.key, this.value, {this.negate = false});

  @override
  String toString() {
    return 'WhereInArgs{key: $key, value: $value, negate: $negate}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is QueryArgs && (key == other.key);

  @override
  int get hashCode => key.hashCode;
}

class OrderBy {
  final String field;
  final bool descending;

  OrderBy(this.field, {this.descending = false});

  @override
  String toString() {
    return 'OrderBy{field: $field, descending: $descending}';
  }

  OrderBy clone({bool? descending}) =>
      OrderBy(field, descending: descending ?? this.descending);
}

class ReadParams {
  final List<OrderBy>? orderBy;
  final List<QueryArgs>? queryArgs;
  final List<PathArgs>? pathArgs;
  final WhereInArgs? whereInArgs;
  final int? limit;
  final dynamic startAfter;

  ReadParams({
    this.orderBy,
    this.queryArgs,
    this.pathArgs,
    this.whereInArgs,
    this.limit,
    this.startAfter,
  });

  @override
  String toString() {
    return 'ReadParams{orderBy: $orderBy, queryArgs: $queryArgs, pathArgs: $pathArgs, whereInArgs: $whereInArgs, limit: $limit, startAfter: $startAfter}';
  }
}
