@interface SQLiteCompoundPredicate
+ (id)negatedPredicate:(id)a3;
+ (id)predicateMatchingAllPredicates:(id)a3;
+ (id)predicateMatchingAnyPredicates:(id)a3;
+ (id)predicateWithProperty:(id)a3 equalToValues:(id)a4;
+ (id)predicateWithProperty:(id)a3 notEqualToValues:(id)a4;
+ (id)predicateWithProperty:(id)a3 values:(id)a4 comparisonType:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)predicates;
- (id)SQLForEntityClass:(Class)a3;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (id)description;
- (unint64_t)hash;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation SQLiteCompoundPredicate

+ (id)predicateMatchingAllPredicates:(id)a3
{
  id v4 = a3;
  v6 = objc_alloc_init((Class)objc_opt_class(a1, v5));
  v6[8] = 0;
  v6[9] = 1;
  v7 = (void *)*((void *)v6 + 2);
  *((void *)v6 + 2) = @" AND ";

  id v8 = [v4 copy];
  v9 = (void *)*((void *)v6 + 3);
  *((void *)v6 + 3) = v8;

  return v6;
}

+ (id)predicateMatchingAnyPredicates:(id)a3
{
  id v4 = a3;
  v6 = objc_alloc_init((Class)objc_opt_class(a1, v5));
  v6[8] = 0;
  v6[9] = 0;
  v7 = (void *)*((void *)v6 + 2);
  *((void *)v6 + 2) = @" OR ";

  id v8 = [v4 copy];
  v9 = (void *)*((void *)v6 + 3);
  *((void *)v6 + 3) = v8;

  return v6;
}

+ (id)negatedPredicate:(id)a3
{
  id v4 = a3;
  v6 = objc_alloc_init((Class)objc_opt_class(a1, v5));
  v6[8] = 1;
  v7 = (void *)*((void *)v6 + 2);
  *((void *)v6 + 2) = @"NOT ";

  id v8 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v4, 0LL);
  v9 = (void *)*((void *)v6 + 3);
  *((void *)v6 + 3) = v8;

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

+ (id)predicateWithProperty:(id)a3 equalToValues:(id)a4
{
  return _[a1 predicateWithProperty:a3 values:a4 comparisonType:1];
}

+ (id)predicateWithProperty:(id)a3 notEqualToValues:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate predicateWithProperty:equalToValues:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "predicateWithProperty:equalToValues:",  a3,  a4));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[SQLiteCompoundPredicate negatedPredicate:]( &OBJC_CLASS___SQLiteCompoundPredicate,  "negatedPredicate:",  v4));

  return v5;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
         objc_opt_class(self, a2),
         self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = v4;
  if (self->_unary) {
    v6 = @"Y";
  }
  else {
    v6 = @"N";
  }
  [v4 appendFormat:@"unary: %@; ", v6];
  if (self->_trueIfNoPredicates) {
    v7 = @"Y";
  }
  else {
    v7 = @"N";
  }
  [v5 appendFormat:@"trueIfNoPredicates: %@; ", v7];
  [v5 appendFormat:@"combinationOperation: %@; ", self->_combinationOperation];
  [v5 appendFormat:@"predicates: %@; ", self->_predicates];
  [v5 appendFormat:@">"];
  return v5;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v6 = self->_predicates;
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend( *(id *)(*((void *)&v11 + 1) + 8 * (void)v10),  "bindToStatement:bindingIndex:",  a3,  a4,  (void)v11);
        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v8);
  }
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SQLiteCompoundPredicate;
  v3 = -[SQLitePredicate hash](&v6, "hash");
  id v4 = &v3[-[NSString hash](self->_combinationOperation, "hash")];
  return (unint64_t)-[NSArray hash](self->_predicates, "hash") + (void)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SQLiteCompoundPredicate;
  if (-[SQLitePredicate isEqual:](&v10, "isEqual:", v4))
  {
    uint64_t v5 = v4;
    combinationOperation = self->_combinationOperation;
    if (combinationOperation == (NSString *)v5[2]
      || -[NSString isEqual:](combinationOperation, "isEqual:"))
    {
      predicates = self->_predicates;
      if (predicates == (NSArray *)v5[3]) {
        unsigned __int8 v8 = 1;
      }
      else {
        unsigned __int8 v8 = -[NSArray isEqual:](predicates, "isEqual:");
      }
    }

    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)SQLForEntityClass:(Class)a3
{
  if (-[NSArray count](self->_predicates, "count"))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"("));
    objc_super v6 = v5;
    if (self->_unary)
    {
      [v5 appendString:self->_combinationOperation];
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_predicates, "objectAtIndex:", 0LL));
      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 SQLForEntityClass:a3]);
      [v6 appendString:v8];
    }

    else
    {
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v11 = self->_predicates;
      id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v18;
        do
        {
          for (i = 0LL; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v17 + 1) + 8 * (void)i),  "SQLForEntityClass:",  a3,  (void)v17));
            if (v16)
            {
              [v6 appendString:v16];
            }
          }

          id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
        }

        while (v13);
      }
    }

    [v6 appendString:@""], (void)v17);
    return v6;
  }

  else
  {
    if (self->_trueIfNoPredicates) {
      uint64_t v9 = @"1";
    }
    else {
      uint64_t v9 = @"0";
    }
    return (id)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  v9));
  }

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = self->_predicates;
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
        objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)i),  "SQLJoinClausesForEntityClass:",  a3,  (void)v12));
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