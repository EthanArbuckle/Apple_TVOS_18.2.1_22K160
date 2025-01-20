@interface DYMTLResourceUsageItem
+ (BOOL)supportsSecureCoding;
- (DYMTLResourceUsageItem)initWithCoder:(id)a3;
- (unint64_t)kind;
- (unint64_t)resourceID;
- (unsigned)stage;
- (unsigned)usage;
- (void)encodeWithCoder:(id)a3;
- (void)setKind:(unint64_t)a3;
- (void)setResourceID:(unint64_t)a3;
- (void)setStage:(unsigned __int8)a3;
- (void)setUsage:(unsigned __int8)a3;
@end

@implementation DYMTLResourceUsageItem

- (DYMTLResourceUsageItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DYMTLResourceUsageItem;
  v5 = -[DYMTLResourceUsageItem init](&v7, "init");
  if (v5)
  {
    v5->_kind = (unint64_t)[v4 decodeInt64ForKey:@"kind"];
    v5->_stage = [v4 decodeInt64ForKey:@"stage"];
    v5->_resourceID = (unint64_t)[v4 decodeInt64ForKey:@"resourceID"];
    v5->_usage = [v4 decodeInt64ForKey:@"usage"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt64:self->_kind forKey:@"kind"];
  [v4 encodeInt64:self->_stage forKey:@"stage"];
  [v4 encodeInt64:self->_resourceID forKey:@"resourceID"];
  [v4 encodeInt64:self->_usage forKey:@"usage"];
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

- (unsigned)usage
{
  return self->_usage;
}

- (void)setUsage:(unsigned __int8)a3
{
  self->_usage = a3;
}

- (unsigned)stage
{
  return self->_stage;
}

- (void)setStage:(unsigned __int8)a3
{
  self->_stage = a3;
}

- (unint64_t)resourceID
{
  return self->_resourceID;
}

- (void)setResourceID:(unint64_t)a3
{
  self->_resourceID = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end