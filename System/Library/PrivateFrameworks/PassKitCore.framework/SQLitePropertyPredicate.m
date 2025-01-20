@interface SQLitePropertyPredicate
- (BOOL)isEqual:(id)a3;
- (NSString)property;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (unint64_t)hash;
@end

@implementation SQLitePropertyPredicate

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SQLitePropertyPredicate;
  id v3 = -[SQLitePredicate hash](&v5, "hash");
  return (unint64_t)v3 + -[NSString hash](self->_property, "hash");
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SQLitePropertyPredicate;
  if (-[SQLitePredicate isEqual:](&v8, "isEqual:", v4))
  {
    property = self->_property;
    if (property == (NSString *)v4[1]) {
      unsigned __int8 v6 = 1;
    }
    else {
      unsigned __int8 v6 = -[NSString isEqual:](property, "isEqual:");
    }
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  objc_super v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[objc_class addJoinClausesForProperty:toJoins:](a3, "addJoinClausesForProperty:toJoins:", self->_property, v5);
  return v5;
}

- (NSString)property
{
  return self->_property;
}

- (void).cxx_destruct
{
}

@end