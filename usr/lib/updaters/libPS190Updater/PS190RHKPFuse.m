@interface PS190RHKPFuse
- (PS190RHKPFuse)initWithValue:(unsigned __int8)a3;
- (id)description;
- (unsigned)value;
@end

@implementation PS190RHKPFuse

- (PS190RHKPFuse)initWithValue:(unsigned __int8)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PS190RHKPFuse;
  result = -[PS190RHKPFuse init](&v5, sel_init);
  if (result) {
    result->_value = a3;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"0x%02x", self->_value);
}

- (unsigned)value
{
  return self->_value;
}

@end