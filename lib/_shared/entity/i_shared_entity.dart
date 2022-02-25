import 'package:grocery_template/_core/entity/i_filterable_entity.dart';
import 'package:grocery_template/_core/entity/i_parsable_entity.dart';
import 'package:grocery_template/_core/entity/i_searchable_entity.dart';
import 'package:grocery_template/_core/entity/i_unique_entity.dart';

abstract class ISharedEntity
    with
        IUniqueEntity<String>,
        IParsableEntity,
        ISearchableEntity,
        IFilterableEntity {}
