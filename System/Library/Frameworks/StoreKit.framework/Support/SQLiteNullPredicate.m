@interface SQLiteNullPredicate
+ (id)isNotNullPredicateWithProperty:(id)a3;
+ (id)isNullPredicateWithProperty:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesNull;
- (id)SQLForEntityClass:(Class)a3;
@end

@implementation SQLiteNullPredicate

+ (id)isNotNullPredicateWithProperty:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)objc_opt_class(a1));
  v5[24] = 0;
  id v6 = [v4 copy];

  v7 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v6;

  return v5;
}

+ (id)isNullPredicateWithProperty:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)objc_opt_class(a1));
  v5[24] = 1;
  id v6 = [v4 copy];

  v7 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SQLiteNullPredicate;
  if (-[SQLitePropertyPredicate isEqual:](&v8, "isEqual:", v4))
  {
    unsigned int v5 = -[SQLiteNullPredicate matchesNull](self, "matchesNull");
    unsigned int v6 = v5 ^ [v4 matchesNull] ^ 1;
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)SQLForEntityClass:(Class)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SQLitePropertyPredicate _transformedSQLForEntityClass:](self, "_transformedSQLForEntityClass:", a3));
  unsigned int v5 = -[SQLiteNullPredicate matchesNull](self, "matchesNull");
  unsigned int v6 = @"IS NOT NULL";
  if (v5) {
    unsigned int v6 = @"IS NULL";
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v6));

  return v7;
}

- (BOOL)matchesNull
{
  return self->_matchesNull;
}

@end