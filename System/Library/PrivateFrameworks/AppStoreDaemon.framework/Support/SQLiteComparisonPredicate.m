@interface SQLiteComparisonPredicate
+ (id)predicateWithProperty:(id)a3 equalToLongLong:(int64_t)a4;
+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (id)SQLForEntityClass:(Class)a3;
- (id)description;
- (id)value;
- (int64_t)comparisonType;
- (unint64_t)hash;
- (void)applyBinding:(id)a3 atIndex:(int *)a4;
@end

@implementation SQLiteComparisonPredicate

+ (id)predicateWithProperty:(id)a3 equalToLongLong:(int64_t)a4
{
  id v6 = a3;
  v7 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateWithProperty:v6 equalToValue:v7]);

  return v8;
}

+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4
{
  return [a1 predicateWithProperty:a3 value:a4 comparisonType:1];
}

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v11 = objc_alloc_init((Class)objc_opt_class(a1, v10));
  v11[2] = a5;
  id v12 = [v9 copy];

  v13 = (void *)v11[1];
  v11[1] = v12;

  else {
    id v14 = v8;
  }
  v15 = (void *)v11[3];
  v11[3] = v14;

  return v11;
}

- (void)applyBinding:(id)a3 atIndex:(int *)a4
{
  id v17 = a3;
  id value = self->_value;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString, v7);
  char isKindOfClass = objc_opt_isKindOfClass(value, v8);
  id v11 = self->_value;
  if ((isKindOfClass & 1) != 0)
  {
    [v17 bindString:self->_value atPosition:*a4];
  }

  else
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber, v10);
    char v13 = objc_opt_isKindOfClass(v11, v12);
    id v15 = self->_value;
    if ((v13 & 1) != 0)
    {
      [v17 bindNumber:self->_value atPosition:*a4];
    }

    else
    {
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSUUID, v14);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0) {
        [v17 bindUUID:self->_value atPosition:*a4];
      }
    }
  }

  ++*a4;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  property = self->super._property;
  uint64_t v7 = sub_100288870(self);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p> %@ %@ '%@'",  v5,  self,  property,  v8,  self->_value));

  return v9;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SQLitePropertyPredicate property](self, "property"));
  v4 = (char *)[v3 hash];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteComparisonPredicate value](self, "value"));
  id v6 = &v4[(void)[v5 hash]];

  return (unint64_t)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SQLiteComparisonPredicate;
  if (-[SQLitePropertyPredicate isEqual:](&v12, "isEqual:", v4)
    && (id v5 = -[SQLiteComparisonPredicate comparisonType](self, "comparisonType"),
        v5 == [v4 comparisonType]))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteComparisonPredicate value](self, "value"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);
    if (v6 == v7)
    {
      unsigned __int8 v10 = 1;
    }

    else
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteComparisonPredicate value](self, "value"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);
      unsigned __int8 v10 = [v8 isEqual:v9];
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (id)SQLForEntityClass:(Class)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SQLitePropertyPredicate property](self, "property"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", v5));

  uint64_t v7 = sub_100288870(self);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@ ?", v6, v8));

  return v9;
}

- (int64_t)comparisonType
{
  return self->_comparisonType;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end