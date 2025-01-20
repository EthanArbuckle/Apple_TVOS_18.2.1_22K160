@interface SQLiteContainsPredicate
+ (id)containsPredicateWithProperty:(id)a3 query:(id)a4 queryProperty:(id)a5;
+ (id)containsPredicateWithProperty:(id)a3 values:(id)a4;
+ (id)doesNotContainPredicateWithProperty:(id)a3 values:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNegative;
- (NSString)queryProperty;
- (SQLiteQuery)query;
- (id)SQLForEntityClass:(Class)a3;
- (id)description;
- (id)values;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation SQLiteContainsPredicate

+ (id)containsPredicateWithProperty:(id)a3 values:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = objc_alloc_init((Class)objc_opt_class(a1, v8));
  id v10 = [v7 copy];

  v11 = (void *)v9[1];
  v9[1] = v10;

  *((_BYTE *)v9 + 16) = 0;
  id v12 = [v6 copy];

  v13 = (void *)v9[5];
  v9[5] = v12;

  return v9;
}

+ (id)containsPredicateWithProperty:(id)a3 query:(id)a4 queryProperty:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v12 = objc_alloc_init((Class)objc_opt_class(a1, v11));
  id v13 = [v10 copy];

  v14 = (void *)v12[1];
  v12[1] = v13;

  *((_BYTE *)v12 + 16) = 0;
  v15 = (void *)v12[3];
  v12[3] = v8;
  id v16 = v8;

  id v17 = [v9 copy];
  v18 = (void *)v12[4];
  v12[4] = v17;

  return v12;
}

+ (id)doesNotContainPredicateWithProperty:(id)a3 values:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_alloc_init((Class)objc_opt_class(a1, v8));
  id v10 = [v7 copy];

  uint64_t v11 = (void *)v9[1];
  v9[1] = v10;

  *((_BYTE *)v9 + 16) = 1;
  id v12 = [v6 copy];

  id v13 = (void *)v9[5];
  v9[5] = v12;

  return v9;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
         objc_opt_class(self, a2),
         self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v4 appendFormat:@"property: %@; ", self->super._property];
  if (self->_negative) {
    v5 = @"Y";
  }
  else {
    v5 = @"N";
  }
  [v4 appendFormat:@"negative: %@; ", v5];
  if (self->_values) {
    [v4 appendFormat:@"values: %@; ", self->_values];
  }
  if (self->_query || self->_queryProperty)
  {
    [v4 appendFormat:@"query: %@; ", self->_query];
    [v4 appendFormat:@"queryProperty: %@; ", self->_queryProperty];
  }

  [v4 appendFormat:@">"];
  return v4;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  if (self->_query)
  {
    -[SQLiteQuery bindToSelectStatement:bindingIndex:](self->_query, "bindToSelectStatement:bindingIndex:", a3, a4);
  }

  else
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v6 = self->_values;
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          SQLiteBindFoundationValueToStatement(a3, *a4, *(objc_object **)(*((void *)&v11 + 1) + 8LL * (void)v10));
          ++*a4;
          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v8);
    }
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SQLiteContainsPredicate;
  if (-[SQLitePropertyPredicate isEqual:](&v10, "isEqual:", v4))
  {
    v5 = (SQLiteQuery **)v4;
    if (self->_negative == *((unsigned __int8 *)v5 + 16)
      && ((values = (SQLiteQuery *)self->_values, values == v5[5])
       || -[SQLiteQuery isEqual:](values, "isEqual:")))
    {
      query = self->_query;
      if (query == v5[3]) {
        unsigned __int8 v8 = 1;
      }
      else {
        unsigned __int8 v8 = -[SQLiteQuery isEqual:](query, "isEqual:");
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"("));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", self->super._property));
  [v5 appendString:v6];

  if (self->_negative) {
    id v7 = CFSTR(" NOT IN (");
  }
  else {
    id v7 = CFSTR(" IN (");
  }
  [v5 appendString:v7];
  query = self->_query;
  if (query)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", self->_queryProperty, 0LL));
    id v10 = -[SQLiteQuery copySelectSQLWithProperties:](query, "copySelectSQLWithProperties:", v9);

    if (v10) {
      [v5 appendString:v10];
    }
  }

  else
  {
    __int128 v12 = (char *)[self->_values count];
    if (v12)
    {
      __int128 v13 = v12;
      [v5 appendString:@"?"];
      __int128 v14 = v13 - 1;
      if (v13 != (char *)1)
      {
        do
        {
          objc_msgSend(v5, "appendString:", @", ?");
          --v14;
        }

        while (v14);
      }
    }
  }

  [v5 appendString:@""]);
  [v5 appendString:@""]);
  return v5;
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

- (id)values
{
  return self->_values;
}

- (void).cxx_destruct
{
}

@end