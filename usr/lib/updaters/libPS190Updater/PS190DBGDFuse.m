@interface PS190DBGDFuse
- (PS190DBGDFuse)initWithValue:(unsigned __int8)a3;
- (id)description;
- (unsigned)value;
@end

@implementation PS190DBGDFuse

- (PS190DBGDFuse)initWithValue:(unsigned __int8)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PS190DBGDFuse;
  result = -[PS190DBGDFuse init](&v5, sel_init);
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