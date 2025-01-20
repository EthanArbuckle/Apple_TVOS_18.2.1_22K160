@interface SQLiteQueryDescriptor
- (BOOL)returnsDistinctEntities;
- (Class)entityClass;
- (NSArray)groupingProperties;
- (NSArray)orderingDirections;
- (NSArray)orderingProperties;
- (SQLitePredicate)predicate;
- (id)_newSelectSQLWithProperties:(id)a3 columns:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)limitCount;
- (void)setEntityClass:(Class)a3;
- (void)setGroupingProperties:(id)a3;
- (void)setLimitCount:(int64_t)a3;
- (void)setOrderingDirections:(id)a3;
- (void)setOrderingProperties:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setReturnsDistinctEntities:(BOOL)a3;
@end

@implementation SQLiteQueryDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5[1] = self->_entityClass;
  v5[2] = self->_limitCount;
  id v6 = -[NSArray copyWithZone:](self->_orderingDirections, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = -[NSArray copyWithZone:](self->_orderingProperties, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = -[NSArray copyWithZone:](self->_groupingProperties, "copyWithZone:", a3);
  v11 = (void *)v5[6];
  v5[6] = v10;

  id v12 = -[SQLitePredicate copyWithZone:](self->_predicate, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  *((_BYTE *)v5 + 56) = self->_returnsDistinctEntities;
  return v5;
}

- (id)_newSelectSQLWithProperties:(id)a3 columns:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  @"SELECT ");
  v9 = v8;
  if (self->_returnsDistinctEntities) {
    -[NSMutableString appendString:](v8, "appendString:", @"DISTINCT ");
  }
  v44 = v7;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", @", "));
  -[NSMutableString appendString:](v9, "appendString:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class databaseTable](self->_entityClass, "databaseTable"));
  -[NSMutableString appendFormat:](v9, "appendFormat:", @" FROM %@", v11);

  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v13 = objc_claimAutoreleasedReturnValue( -[SQLitePredicate SQLJoinClausesForEntityClass:]( self->_predicate,  "SQLJoinClausesForEntityClass:",  self->_entityClass));
  if (v13) {
    -[NSMutableSet unionSet:](v12, "unionSet:", v13);
  }
  v43 = (void *)v13;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v14 = v6;
  id v15 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v50;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v50 != v17) {
          objc_enumerationMutation(v14);
        }
        -[objc_class addJoinClausesForProperty:toJoins:]( self->_entityClass,  "addJoinClausesForProperty:toJoins:",  *(void *)(*((void *)&v49 + 1) + 8LL * (void)i),  v12);
      }

      id v16 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }

    while (v16);
  }

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  v19 = v12;
  id v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v45,  v53,  16LL);
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v46;
    do
    {
      for (j = 0LL; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v46 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v45 + 1) + 8LL * (void)j);
        -[NSMutableString appendString:](v9, "appendString:", @" ");
        -[NSMutableString appendString:](v9, "appendString:", v24);
      }

      id v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v45,  v53,  16LL);
    }

    while (v21);
  }

  uint64_t v25 = objc_claimAutoreleasedReturnValue(-[SQLitePredicate SQLForEntityClass:](self->_predicate, "SQLForEntityClass:", self->_entityClass));
  if (v25)
  {
    -[NSMutableString appendString:](v9, "appendString:", @" WHERE ");
    -[NSMutableString appendString:](v9, "appendString:", v25);
  }

  v42 = (void *)v25;
  uint64_t v26 = -[NSArray count](self->_groupingProperties, "count");
  if (v26 >= 1)
  {
    uint64_t v27 = v26;
    v28 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    for (uint64_t k = 0LL; k != v27; ++k)
    {
      Class entityClass = self->_entityClass;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_groupingProperties, "objectAtIndex:", k));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class disambiguatedSQLForProperty:](entityClass, "disambiguatedSQLForProperty:", v31));

      if (-[NSMutableString length](v28, "length")) {
        -[NSMutableString appendString:](v28, "appendString:", @", ");
      }
      -[NSMutableString appendString:](v28, "appendString:", v32);
      -[NSMutableString appendString:](v28, "appendString:", @" ");
    }

    -[NSMutableString appendString:](v9, "appendString:", @" GROUP BY ");
    -[NSMutableString appendString:](v9, "appendString:", v28);
  }

  uint64_t v33 = -[NSArray count](self->_orderingProperties, "count");
  if (v33 >= 1)
  {
    uint64_t v34 = v33;
    v35 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    for (unint64_t m = 0LL; m != v34; ++m)
    {
      Class v37 = self->_entityClass;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_orderingProperties, "objectAtIndex:", m));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class disambiguatedSQLForProperty:](v37, "disambiguatedSQLForProperty:", v38));

      if (-[NSMutableString length](v35, "length")) {
        -[NSMutableString appendString:](v35, "appendString:", @", ");
      }
      -[NSMutableString appendString:](v35, "appendString:", v39);
      -[NSMutableString appendString:](v35, "appendString:", @" ");
      if (m >= -[NSArray count](self->_orderingDirections, "count"))
      {
        -[NSMutableString appendString:](v35, "appendString:", @"ASC");
      }

      else
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_orderingDirections, "objectAtIndex:", m));
        -[NSMutableString appendString:](v35, "appendString:", v40);
      }
    }

    -[NSMutableString appendString:](v9, "appendString:", @" ORDER BY ");
    -[NSMutableString appendString:](v9, "appendString:", v35);
  }

  if (self->_limitCount) {
    -[NSMutableString appendString:](v9, "appendString:", @" LIMIT ?");
  }

  return v9;
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (void)setEntityClass:(Class)a3
{
  self->_Class entityClass = a3;
}

- (int64_t)limitCount
{
  return self->_limitCount;
}

- (void)setLimitCount:(int64_t)a3
{
  self->_limitCount = a3;
}

- (NSArray)orderingDirections
{
  return self->_orderingDirections;
}

- (void)setOrderingDirections:(id)a3
{
}

- (NSArray)orderingProperties
{
  return self->_orderingProperties;
}

- (void)setOrderingProperties:(id)a3
{
}

- (SQLitePredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (BOOL)returnsDistinctEntities
{
  return self->_returnsDistinctEntities;
}

- (void)setReturnsDistinctEntities:(BOOL)a3
{
  self->_returnsDistinctEntities = a3;
}

- (NSArray)groupingProperties
{
  return self->_groupingProperties;
}

- (void)setGroupingProperties:(id)a3
{
}

- (void).cxx_destruct
{
}

@end