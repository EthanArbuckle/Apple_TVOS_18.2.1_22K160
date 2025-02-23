@interface SQLitePropertyPredicate
- (BOOL)isEqual:(id)a3;
- (NSString)property;
- (SQLiteValueTransform)transform;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (id)_transformedSQLForEntityClass:(Class)a3;
- (unint64_t)hash;
- (void)applyBinding:(id)a3 atIndex:(int *)a4;
- (void)setTransform:(id)a3;
@end

@implementation SQLitePropertyPredicate

- (id)_transformedSQLForEntityClass:(Class)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLitePropertyPredicate property](self, "property"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", v5));
  v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[SQLitePropertyPredicate property](self, "property"));
  }
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SQLitePropertyPredicate transform](self, "transform"));
  v11 = v10;
  if (v10) {
    id v12 = (id)objc_claimAutoreleasedReturnValue([v10 transformSQLWithRoot:v9]);
  }
  else {
    id v12 = v9;
  }
  v13 = v12;

  return v13;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SQLitePropertyPredicate;
  id v3 = -[SQLitePredicate hash](&v9, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLitePropertyPredicate property](self, "property"));
  id v5 = [v4 hash];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLitePropertyPredicate transform](self, "transform"));
  v7 = (char *)[v6 hash] + (void)v5 + (unint64_t)v3;

  return (unint64_t)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SQLitePropertyPredicate;
  if (-[SQLitePredicate isEqual:](&v16, "isEqual:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SQLitePropertyPredicate property](self, "property"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 property]);
    if (v7 == v8
      || (id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLitePropertyPredicate property](self, "property")),
          v4 = (void *)objc_claimAutoreleasedReturnValue([v6 property]),
          [v3 isEqual:v4]))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SQLitePropertyPredicate transform](self, "transform"));
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 transform]);
      if (v10 == (void *)v11)
      {

        unsigned __int8 v9 = 1;
      }

      else
      {
        id v12 = (void *)v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SQLitePropertyPredicate transform](self, "transform"));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v6 transform]);
        unsigned __int8 v9 = [v13 isEqual:v14];
      }

      if (v7 == v8) {
        goto LABEL_11;
      }
    }

    else
    {
      unsigned __int8 v9 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }

  unsigned __int8 v9 = 0;
LABEL_12:

  return v9;
}

- (void)applyBinding:(id)a3 atIndex:(int *)a4
{
  id v8 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLitePropertyPredicate transform](self, "transform"));
  v7 = v6;
  if (v6) {
    [v6 applyTransformBinding:v8 atIndex:a4];
  }
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class joinClauseForProperty:](a3, "joinClauseForProperty:", self->_property));
  if (v3) {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v3));
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (NSString)property
{
  return self->_property;
}

- (SQLiteValueTransform)transform
{
  return self->_transform;
}

- (void)setTransform:(id)a3
{
}

- (void).cxx_destruct
{
}

@end