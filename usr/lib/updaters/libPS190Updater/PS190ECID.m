@interface PS190ECID
- (PS190ECID)initWithValue:(unint64_t)a3;
- (id)description;
- (unint64_t)value;
@end

@implementation PS190ECID

- (PS190ECID)initWithValue:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PS190ECID;
  result = -[PS190ECID init](&v5, sel_init);
  if (result) {
    result->_value = a3;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"0x%llx", self->_value);
}

- (unint64_t)value
{
  return self->_value;
}

@end