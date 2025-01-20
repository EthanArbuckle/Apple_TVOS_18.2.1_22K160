@interface DBGInteger
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withValue:(int64_t)a3;
- (BOOL)backingTypeIsLong;
- (DBGInteger)initWithInteger:(int64_t)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (int64_t)integerValue;
- (void)setBackingTypeIsLong:(BOOL)a3;
- (void)setIntegerValue:(int64_t)a3;
@end

@implementation DBGInteger

+ (id)withValue:(int64_t)a3
{
  return [objc_alloc((Class)a1) initWithInteger:a3];
}

- (DBGInteger)initWithInteger:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DBGInteger;
  result = -[DBGInteger init](&v5, "init");
  if (result) {
    result->_integerValue = a3;
  }
  return result;
}

- (id)objectValue
{
  return +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[DBGInteger integerValue](self, "integerValue"));
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGInteger objectValue](self, "objectValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGInteger description](self, "description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (void)setIntegerValue:(int64_t)a3
{
  self->_integerValue = a3;
}

- (BOOL)backingTypeIsLong
{
  return self->_backingTypeIsLong;
}

- (void)setBackingTypeIsLong:(BOOL)a3
{
  self->_backingTypeIsLong = a3;
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if ([a4 isEqualToString:@"integer"])
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber, v9);
    if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
    {
      id v12 = [v8 integerValue];
LABEL_6:
      id v14 = v12;
      goto LABEL_10;
    }

    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v11);
    if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
    {
      id v12 = [v8 dbgIntegerValue];
      goto LABEL_6;
    }
  }

  id v14 = 0LL;
  if (!v8 && a5)
  {
    id v14 = 0LL;
    *a5 = 0LL;
  }

- (id)JSONCompatibleRepresentation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[DBGInteger integerValue](self, "integerValue")));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dbgStringForType:@"integer" error:0]);

  return v3;
}

@end