@interface SQLiteBooleanPredicate
+ (id)falsePredicate;
+ (id)truePredicate;
- (BOOL)BOOLeanValue;
- (BOOL)isEqual:(id)a3;
- (id)SQLForEntityClass:(Class)a3;
- (id)description;
@end

@implementation SQLiteBooleanPredicate

+ (id)truePredicate
{
  v2 = objc_alloc_init((Class)objc_opt_class(a1, a2));
  v2[8] = 1;
  return v2;
}

+ (id)falsePredicate
{
  v2 = objc_alloc_init((Class)objc_opt_class(a1, a2));
  v2[8] = 0;
  return v2;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
         objc_opt_class(self, a2),
         self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (self->_BOOLeanValue) {
    v6 = @"Y";
  }
  else {
    v6 = @"N";
  }
  [v4 appendFormat:@"BOOLeanValue: %@; ", v6];
  [v5 appendFormat:@">"];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SQLiteBooleanPredicate;
  if (-[SQLitePredicate isEqual:](&v7, "isEqual:", v4)) {
    BOOL v5 = self->_BOOLeanValue == v4[8];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)SQLForEntityClass:(Class)a3
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(%d)", self->_BOOLeanValue);
}

- (BOOL)BOOLeanValue
{
  return self->_BOOLeanValue;
}

@end