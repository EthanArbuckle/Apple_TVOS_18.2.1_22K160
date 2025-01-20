@interface SQLiteNullPredicate
+ (id)isNotNullPredicateWithProperty:(id)a3;
+ (id)isNullPredicateWithProperty:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesNull;
- (id)SQLForEntityClass:(Class)a3;
- (id)description;
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

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
         objc_opt_class(self, a2),
         self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v4 appendFormat:@"property: %@; ", self->super._property];
  if (self->_matchesNull) {
    uint64_t v5 = @"Y";
  }
  else {
    uint64_t v5 = @"N";
  }
  [v4 appendFormat:@"matchesNull: %@; ", v5];
  [v4 appendFormat:@">"];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SQLiteNullPredicate;
  if (-[SQLitePropertyPredicate isEqual:](&v7, "isEqual:", v4)) {
    BOOL v5 = self->_matchesNull == v4[16];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)SQLForEntityClass:(Class)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", self->super._property));
  if (self->_matchesNull) {
    BOOL v5 = @"IS NULL";
  }
  else {
    BOOL v5 = @"IS NOT NULL";
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(%@ %@)", v4, v5));

  return v6;
}

- (BOOL)matchesNull
{
  return self->_matchesNull;
}

@end