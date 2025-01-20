@interface SQLiteQueryDescriptor
- (BOOL)returnsDistinctEntities;
- (Class)entityClass;
- (Class)memoryEntityClass;
- (NSArray)orderingDirections;
- (NSArray)orderingProperties;
- (NSString)orderingClause;
- (SQLitePredicate)predicate;
- (SQLiteQueryDescriptor)initWithEntityClass:(Class)a3;
- (SQLiteQueryDescriptor)initWithEntityClass:(Class)a3 memoryEntityClass:(Class)a4;
- (id)_newSelectSQLWithProperties:(id)a3 columns:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)limitCount;
- (void)setEntityClass:(Class)a3;
- (void)setLimitCount:(int64_t)a3;
- (void)setMemoryEntityClass:(Class)a3;
- (void)setOrderingClause:(id)a3;
- (void)setOrderingDirections:(id)a3;
- (void)setOrderingProperties:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setReturnsDistinctEntities:(BOOL)a3;
@end

@implementation SQLiteQueryDescriptor

- (SQLiteQueryDescriptor)initWithEntityClass:(Class)a3
{
  return -[SQLiteQueryDescriptor initWithEntityClass:memoryEntityClass:]( self,  "initWithEntityClass:memoryEntityClass:",  a3,  0LL);
}

- (SQLiteQueryDescriptor)initWithEntityClass:(Class)a3 memoryEntityClass:(Class)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SQLiteQueryDescriptor;
  result = -[SQLiteQueryDescriptor init](&v7, "init");
  if (result)
  {
    result->_entityClass = a3;
    result->_memoryEntityClass = a4;
  }

  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5[1] = self->_entityClass;
  v5[2] = self->_limitCount;
  v5[3] = self->_memoryEntityClass;
  id v6 = -[NSString copyWithZone:](self->_orderingClause, "copyWithZone:", a3);
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = -[NSArray copyWithZone:](self->_orderingDirections, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  id v10 = -[NSArray copyWithZone:](self->_orderingProperties, "copyWithZone:", a3);
  v11 = (void *)v5[6];
  v5[6] = v10;

  id v12 = -[SQLitePredicate copyWithZone:](self->_predicate, "copyWithZone:", a3);
  v13 = (void *)v5[7];
  v5[7] = v12;

  *((_BYTE *)v5 + 64) = self->_returnsDistinctEntities;
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
  v37 = v7;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", @", "));
  -[NSMutableString appendString:](v9, "appendString:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class databaseTable](self->_entityClass, "databaseTable"));
  -[NSMutableString appendFormat:](v9, "appendFormat:", @" FROM %@", v11);

  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v13 = objc_claimAutoreleasedReturnValue( -[SQLitePredicate SQLJoinClausesForEntityClass:]( self->_predicate,  "SQLJoinClausesForEntityClass:",  self->_entityClass));
  if (v13) {
    -[NSMutableSet unionSet:](v12, "unionSet:", v13);
  }
  v36 = (void *)v13;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v14 = v6;
  id v15 = [v14 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v43;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v43 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class joinClauseForProperty:]( self->_entityClass,  "joinClauseForProperty:",  *(void *)(*((void *)&v42 + 1) + 8LL * (void)i)));
        if (v19) {
          -[NSMutableSet addObject:](v12, "addObject:", v19);
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }

    while (v16);
  }

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  v20 = v12;
  id v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v38,  v46,  16LL);
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v39;
    do
    {
      for (j = 0LL; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v39 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)j);
        -[NSMutableString appendString:](v9, "appendString:", @" ");
        -[NSMutableString appendString:](v9, "appendString:", v25);
      }

      id v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v38,  v46,  16LL);
    }

    while (v22);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SQLitePredicate SQLForEntityClass:](self->_predicate, "SQLForEntityClass:", self->_entityClass));
  if (v26)
  {
    -[NSMutableString appendString:](v9, "appendString:", @" WHERE ");
    -[NSMutableString appendString:](v9, "appendString:", v26);
  }

  uint64_t v27 = -[NSArray count](self->_orderingProperties, "count");
  if (self->_orderingClause)
  {
    -[NSMutableString appendString:](v9, "appendString:", @" ORDER BY ");
    -[NSMutableString appendString:](v9, "appendString:", self->_orderingClause);
  }

  else
  {
    uint64_t v28 = v27;
    if (v27 >= 1)
    {
      v29 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
      unint64_t v30 = 0LL;
      do
      {
        Class entityClass = self->_entityClass;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_orderingProperties, "objectAtIndex:", v30));
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class disambiguatedSQLForProperty:](entityClass, "disambiguatedSQLForProperty:", v32));

        if (-[NSMutableString length](v29, "length")) {
          -[NSMutableString appendString:](v29, "appendString:", @", ");
        }
        -[NSMutableString appendString:](v29, "appendString:", v33);
        -[NSMutableString appendString:](v29, "appendString:", @" ");
        if (v30 >= -[NSArray count](self->_orderingDirections, "count"))
        {
          -[NSMutableString appendString:](v29, "appendString:", @"ASC");
        }

        else
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_orderingDirections, "objectAtIndex:", v30));
          -[NSMutableString appendString:](v29, "appendString:", v34);
        }

        ++v30;
      }

      while (v28 != v30);
      -[NSMutableString appendString:](v9, "appendString:", @" ORDER BY ");
      -[NSMutableString appendString:](v9, "appendString:", v29);
    }
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

- (Class)memoryEntityClass
{
  return self->_memoryEntityClass;
}

- (void)setMemoryEntityClass:(Class)a3
{
  self->_memoryEntityClass = a3;
}

- (int64_t)limitCount
{
  return self->_limitCount;
}

- (void)setLimitCount:(int64_t)a3
{
  self->_limitCount = a3;
}

- (NSString)orderingClause
{
  return self->_orderingClause;
}

- (void)setOrderingClause:(id)a3
{
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

- (BOOL)returnsDistinctEntities
{
  return self->_returnsDistinctEntities;
}

- (void)setReturnsDistinctEntities:(BOOL)a3
{
  self->_returnsDistinctEntities = a3;
}

- (SQLitePredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end