@interface FPAuxData
- (BOOL)fp_isContainer;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAggregate;
- (BOOL)supportsFormattedValue;
- (FPAuxData)initWithValue:(int64_t)a3 shouldAggregate:(BOOL)a4;
- (const)formattedValue;
- (id)description;
- (id)formatter;
- (id)fp_jsonRepresentation;
- (int64_t)value;
- (void)setFormatter:(id)a3;
@end

@implementation FPAuxData

- (FPAuxData)initWithValue:(int64_t)a3 shouldAggregate:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___FPAuxData;
  result = -[FPAuxData init](&v7, "init");
  if (result)
  {
    result->_aggregate = a4;
    result->_value = a3;
  }

  return result;
}

- (id)description
{
  if (-[FPAuxData supportsFormattedValue](self, "supportsFormattedValue"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  -[FPAuxData formattedValue](self, "formattedValue")));
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[FPAuxData value](self, "value")));
    v3 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
  }

  return v3;
}

- (BOOL)fp_isContainer
{
  return 0;
}

- (id)fp_jsonRepresentation
{
  return +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_value);
}

- (BOOL)supportsFormattedValue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FPAuxData formatter](self, "formatter"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (const)formattedValue
{
  BOOL v3 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(-[FPAuxData formatter](self, "formatter"));
  v4 = (const char *)v3[2](v3, -[FPAuxData value](self, "value"));

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___FPAuxData);
  BOOL v6 = (objc_opt_isKindOfClass(v4, v5) & 1) != 0 && self->_value == v4[2];

  return v6;
}

- (int64_t)value
{
  return self->_value;
}

- (BOOL)shouldAggregate
{
  return self->_aggregate;
}

- (id)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end