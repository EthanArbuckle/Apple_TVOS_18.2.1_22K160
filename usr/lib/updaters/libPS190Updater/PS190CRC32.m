@interface PS190CRC32
- (PS190CRC32)initWithValue:(unsigned int)a3;
- (id)description;
- (unsigned)value;
@end

@implementation PS190CRC32

- (PS190CRC32)initWithValue:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PS190CRC32;
  result = -[PS190CRC32 init](&v5, sel_init);
  if (result) {
    result->_value = a3;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"0x%08x", self->_value);
}

- (unsigned)value
{
  return self->_value;
}

@end