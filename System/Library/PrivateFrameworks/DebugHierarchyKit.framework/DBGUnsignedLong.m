@interface DBGUnsignedLong
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withValue:(unint64_t)a3;
- (DBGUnsignedLong)initWithUnsignedLong:(unint64_t)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (unint64_t)unsignedLongValue;
- (void)setUnsignedLongValue:(unint64_t)a3;
@end

@implementation DBGUnsignedLong

+ (id)withValue:(unint64_t)a3
{
  return [objc_alloc((Class)a1) initWithUnsignedLong:a3];
}

- (DBGUnsignedLong)initWithUnsignedLong:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DBGUnsignedLong;
  result = -[DBGUnsignedLong init](&v5, "init");
  if (result) {
    result->_unsignedLongValue = a3;
  }
  return result;
}

- (id)objectValue
{
  return +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  -[DBGUnsignedLong unsignedLongValue](self, "unsignedLongValue"));
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGUnsignedLong objectValue](self, "objectValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGUnsignedLong description](self, "description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (unint64_t)unsignedLongValue
{
  return self->_unsignedLongValue;
}

- (void)setUnsignedLongValue:(unint64_t)a3
{
  self->_unsignedLongValue = a3;
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if ([a4 isEqualToString:@"ul"])
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber, v9);
    if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
    {
      id v12 = [v8 unsignedLongValue];
LABEL_6:
      id v14 = v12;
      goto LABEL_10;
    }

    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v11);
    if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
    {
      id v12 = [v8 dbgUnsignedLongValue];
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
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  -[DBGUnsignedLong unsignedLongValue](self, "unsignedLongValue")));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dbgStringForType:@"ul" error:0]);

  return v3;
}

@end