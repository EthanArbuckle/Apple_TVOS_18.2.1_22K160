@interface SQLiteContainsPredicate
+ (id)containsPredicateWithProperty:(id)a3 query:(id)a4 queryProperty:(id)a5;
+ (id)containsPredicateWithProperty:(id)a3 values:(id)a4;
+ (id)doesNotContainPredicateWithProperty:(id)a3 values:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNegative;
- (NSArray)values;
- (NSString)queryProperty;
- (SQLiteQuery)query;
- (id)SQLForEntityClass:(Class)a3;
- (void)applyBinding:(id)a3 atIndex:(int *)a4;
@end

@implementation SQLiteContainsPredicate

+ (id)containsPredicateWithProperty:(id)a3 values:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init((Class)objc_opt_class(a1));
  id v9 = [v7 copy];

  v10 = (void *)v8[1];
  v8[1] = v9;

  *((_BYTE *)v8 + 24) = 0;
  id v11 = [v6 copy];

  v12 = (void *)v8[6];
  v8[6] = v11;

  return v8;
}

+ (id)containsPredicateWithProperty:(id)a3 query:(id)a4 queryProperty:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)objc_opt_class(a1));
  id v12 = [v10 copy];

  v13 = (void *)v11[1];
  v11[1] = v12;

  *((_BYTE *)v11 + 24) = 0;
  v14 = (void *)v11[4];
  v11[4] = v8;
  id v15 = v8;

  id v16 = [v9 copy];
  v17 = (void *)v11[5];
  v11[5] = v16;

  return v11;
}

+ (id)doesNotContainPredicateWithProperty:(id)a3 values:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)objc_opt_class(a1));
  id v9 = [v7 copy];

  id v10 = (void *)v8[1];
  v8[1] = v9;

  *((_BYTE *)v8 + 24) = 1;
  id v11 = [v6 copy];

  id v12 = (void *)v8[6];
  v8[6] = v11;

  return v8;
}

- (void)applyBinding:(id)a3 atIndex:(int *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SQLiteContainsPredicate;
  -[SQLitePropertyPredicate applyBinding:atIndex:](&v17, "applyBinding:atIndex:", v6, a4);
  query = self->_query;
  if (query)
  {
    -[SQLiteQuery applyBinding:atIndex:](query, "applyBinding:atIndex:", v6, a4);
  }

  else
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v8 = self->_values;
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          sub_10000863C(v6, *a4, *(void **)(*((void *)&v13 + 1) + 8LL * (void)i));
          ++*a4;
        }

        id v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }

      while (v10);
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SQLiteContainsPredicate;
  if (-[SQLitePropertyPredicate isEqual:](&v17, "isEqual:", v6))
  {
    unsigned int v7 = -[SQLiteContainsPredicate isNegative](self, "isNegative");
    if (v7 == [v6 isNegative])
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteContainsPredicate values](self, "values"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 values]);
      if (v9 == v10
        || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteContainsPredicate values](self, "values")),
            v4 = (void *)objc_claimAutoreleasedReturnValue([v6 values]),
            [v3 isEqual:v4]))
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteContainsPredicate query](self, "query"));
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v6 query]);
        if (v11 == (void *)v12)
        {

          unsigned __int8 v8 = 1;
        }

        else
        {
          __int128 v13 = (void *)v12;
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteContainsPredicate query](self, "query"));
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 query]);
          unsigned __int8 v8 = [v14 isEqual:v15];
        }

        if (v9 == v10) {
          goto LABEL_12;
        }
      }

      else
      {
        unsigned __int8 v8 = 0;
      }

LABEL_12:
      goto LABEL_13;
    }
  }

  unsigned __int8 v8 = 0;
LABEL_13:

  return v8;
}

- (id)SQLForEntityClass:(Class)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLitePropertyPredicate _transformedSQLForEntityClass:](self, "_transformedSQLForEntityClass:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", v4));
  id v6 = v5;
  if (self->_negative) {
    unsigned int v7 = CFSTR(" NOT IN (");
  }
  else {
    unsigned int v7 = CFSTR(" IN (");
  }
  [v5 appendString:v7];
  query = self->_query;
  if (query)
  {
    queryProperty = self->_queryProperty;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &queryProperty,  1LL));
    id v10 = -[SQLiteQuery copySelectSQLWithProperties:](query, "copySelectSQLWithProperties:", v9);

    if (v10) {
      [v6 appendString:v10];
    }
  }

  else
  {
    uint64_t v12 = (char *)[self->_values count];
    if (v12)
    {
      __int128 v13 = v12;
      [v6 appendString:@"?"];
      __int128 v14 = v13 - 1;
      if (v13 != (char *)1)
      {
        do
        {
          objc_msgSend(v6, "appendString:", @", ?");
          --v14;
        }

        while (v14);
      }
    }
  }

  [v6 appendString:@""]);

  return v6;
}

- (BOOL)isNegative
{
  return self->_negative;
}

- (SQLiteQuery)query
{
  return self->_query;
}

- (NSString)queryProperty
{
  return self->_queryProperty;
}

- (NSArray)values
{
  return (NSArray *)self->_values;
}

- (void).cxx_destruct
{
}

@end