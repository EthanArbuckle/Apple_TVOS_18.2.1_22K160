@interface ResourceUsageLocation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqualTo:(id)a3;
- (ResourceUsageLocation)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)subCommandIndex;
- (unint64_t)functionIndex;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFunctionIndex:(unint64_t)a3;
- (void)setSubCommandIndex:(int64_t)a3;
@end

@implementation ResourceUsageLocation

- (ResourceUsageLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ResourceUsageLocation;
  v5 = -[ResourceUsageLocation init](&v7, "init");
  if (v5)
  {
    v5->_functionIndex = (unint64_t)[v4 decodeInt64ForKey:@"functionIndex"];
    v5->_subCommandIndex = (int64_t)[v4 decodeInt64ForKey:@"subCommandIndex"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt64:self->_functionIndex forKey:@"functionIndex"];
  [v4 encodeInt64:self->_subCommandIndex forKey:@"subCommandIndex"];
}

- (BOOL)isEqualTo:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___ResourceUsageLocation, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    id v8 = -[ResourceUsageLocation functionIndex](self, "functionIndex");
    if (v8 == [v7 functionIndex])
    {
      id v9 = -[ResourceUsageLocation subCommandIndex](self, "subCommandIndex");
      BOOL v10 = v9 == [v7 subCommandIndex];
    }

    else
    {
      BOOL v10 = 0;
    }
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = -[ResourceUsageLocation functionIndex](self, "functionIndex");
  return -[ResourceUsageLocation subCommandIndex](self, "subCommandIndex") | (v3 << 32);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___ResourceUsageLocation);
  -[ResourceUsageLocation setFunctionIndex:](v4, "setFunctionIndex:", self->_functionIndex);
  -[ResourceUsageLocation setSubCommandIndex:](v4, "setSubCommandIndex:", self->_subCommandIndex);
  return v4;
}

- (unint64_t)functionIndex
{
  return self->_functionIndex;
}

- (void)setFunctionIndex:(unint64_t)a3
{
  self->_functionIndex = a3;
}

- (int64_t)subCommandIndex
{
  return self->_subCommandIndex;
}

- (void)setSubCommandIndex:(int64_t)a3
{
  self->_subCommandIndex = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end