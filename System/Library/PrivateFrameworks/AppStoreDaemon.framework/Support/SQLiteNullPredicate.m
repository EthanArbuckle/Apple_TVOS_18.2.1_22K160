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
  v6 = objc_alloc_init((Class)objc_opt_class(a1, v5));
  v6[16] = 0;
  id v7 = [v4 copy];

  v8 = (void *)*((void *)v6 + 1);
  *((void *)v6 + 1) = v7;

  return v6;
}

+ (id)isNullPredicateWithProperty:(id)a3
{
  id v4 = a3;
  v6 = objc_alloc_init((Class)objc_opt_class(a1, v5));
  v6[16] = 1;
  id v7 = [v4 copy];

  v8 = (void *)*((void *)v6 + 1);
  *((void *)v6 + 1) = v7;

  return v6;
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
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLitePropertyPredicate property](self, "property"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", v5));

  unsigned int v7 = -[SQLiteNullPredicate matchesNull](self, "matchesNull");
  objc_super v8 = @"IS NOT NULL";
  if (v7) {
    objc_super v8 = @"IS NULL";
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v6, v8));

  return v9;
}

- (BOOL)matchesNull
{
  return self->_matchesNull;
}

@end