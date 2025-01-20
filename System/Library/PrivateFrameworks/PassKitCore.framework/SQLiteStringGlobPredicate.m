@interface SQLiteStringGlobPredicate
+ (id)predicateWithProperty:(id)a3 havingPrefix:(id)a4;
+ (id)predicateWithProperty:(id)a3 havingSuffix:(id)a4;
+ (id)predicateWithProperty:(id)a3 matchingPattern:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)pattern;
- (NSString)property;
- (id)SQLForEntityClass:(Class)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation SQLiteStringGlobPredicate

+ (id)predicateWithProperty:(id)a3 havingPrefix:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a4 stringByAppendingString:@"*"]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateWithProperty:v6 matchingPattern:v7]);

  return v8;
}

+ (id)predicateWithProperty:(id)a3 havingSuffix:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([@"*" stringByAppendingString:a4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateWithProperty:v6 matchingPattern:v7]);

  return v8;
}

+ (id)predicateWithProperty:(id)a3 matchingPattern:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = objc_alloc_init((Class)objc_opt_class(a1, v8));
  id v10 = [v7 copy];

  v11 = (void *)v9[1];
  v9[1] = v10;

  id v12 = [v6 copy];
  v13 = (void *)v9[2];
  v9[2] = v12;

  return v9;
}

- (id)SQLForEntityClass:(Class)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"("));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteStringGlobPredicate property](self, "property"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", v6));
  [v5 appendString:v7];

  [v5 appendString:@" GLOB "];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteStringGlobPredicate pattern](self, "pattern"));
  [v5 appendFormat:@"'%@'", v8];

  [v5 appendString:@""]);
  return v5;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
         objc_opt_class(self, a2),
         self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v4 appendFormat:@"property: %@; ", self->_property];
  [v4 appendFormat:@"pattern: %@; ", self->_pattern];
  [v4 appendFormat:@">"];
  return v4;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SQLiteStringGlobPredicate;
  v3 = -[SQLitePredicate hash](&v6, "hash");
  v4 = &v3[-[NSString hash](self->_property, "hash")];
  return -[NSString hash](self->_pattern, "hash") + (void)v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SQLiteStringGlobPredicate;
  if (-[SQLitePredicate isEqual:](&v8, "isEqual:", v4))
  {
    pattern = self->_pattern;
    if (pattern == (NSString *)v4[2]) {
      unsigned __int8 v6 = 1;
    }
    else {
      unsigned __int8 v6 = -[NSString isEqual:](pattern, "isEqual:");
    }
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (NSString)property
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSString)pattern
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end