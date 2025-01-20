@interface SQLiteCompoundPredicate
+ (id)predicateMatchingAllPredicates:(id)a3;
+ (id)predicateMatchingAnyPredicates:(id)a3;
+ (id)predicateWithProperty:(id)a3 values:(id)a4 comparisonType:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)predicates;
- (id)SQLForEntityClass:(Class)a3;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (unint64_t)hash;
- (void)applyBinding:(id)a3 atIndex:(int *)a4;
@end

@implementation SQLiteCompoundPredicate

+ (id)predicateMatchingAllPredicates:(id)a3
{
  id v4 = a3;
  v6 = objc_alloc_init((Class)objc_opt_class(a1, v5));
  v7 = (void *)v6[1];
  v6[1] = @" AND ";

  id v8 = [v4 copy];
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

+ (id)predicateMatchingAnyPredicates:(id)a3
{
  id v4 = a3;
  v6 = objc_alloc_init((Class)objc_opt_class(a1, v5));
  v7 = (void *)v6[1];
  v6[1] = @" OR ";

  id v8 = [v4 copy];
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

+ (id)predicateWithProperty:(id)a3 values:(id)a4 comparisonType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  v8,  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v15),  a5,  (void)v19));
        -[NSMutableArray addObject:](v10, "addObject:", v16);

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v13);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateMatchingAnyPredicates:v10]);
  return v17;
}

- (void)applyBinding:(id)a3 atIndex:(int *)a4
{
  id v6 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v7 = self->_predicates;
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v11), "applyBinding:atIndex:", v6, a4, (void)v12);
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SQLiteCompoundPredicate;
  id v3 = -[SQLitePredicate hash](&v8, "hash");
  NSUInteger v4 = -[NSString hash](self->_combinationOperation, "hash");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteCompoundPredicate predicates](self, "predicates"));
  id v6 = (char *)[v5 hash] + (void)v3 + v4;

  return (unint64_t)v6;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SQLiteCompoundPredicate;
  if (-[SQLitePredicate isEqual:](&v12, "isEqual:", v4)
    && ((combinationOperation = self->_combinationOperation, combinationOperation == (NSString *)v4[1])
     || -[NSString isEqual:](combinationOperation, "isEqual:")))
  {
    predicates = self->_predicates;
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue([v4 predicates]);
    if (predicates == v7)
    {
      unsigned __int8 v10 = 1;
    }

    else
    {
      objc_super v8 = self->_predicates;
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 predicates]);
      unsigned __int8 v10 = -[NSArray isEqual:](v8, "isEqual:", v9);
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (id)SQLForEntityClass:(Class)a3
{
  if (-[NSArray count](self->_predicates, "count"))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"("));
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = self->_predicates;
    id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)i),  "SQLForEntityClass:",  a3,  (void)v13));
          if (v11)
          {
            [v5 appendString:v11];
          }
        }

        id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v8);
    }

    [v5 appendString:@""]);
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"1"));
  }

  return v5;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  NSUInteger v4 = self->_predicates;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    id v7 = 0LL;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)i),  "SQLJoinClausesForEntityClass:",  a3,  (void)v12));
        if (v10)
        {
          if (!v7) {
            id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
          }
          [v7 unionSet:v10];
        }
      }

      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (NSArray)predicates
{
  return self->_predicates;
}

- (void).cxx_destruct
{
}

@end