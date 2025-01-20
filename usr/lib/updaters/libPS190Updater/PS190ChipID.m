@interface PS190ChipID
- (PS190ChipID)initWithChipID:(unsigned int)a3;
- (id)description;
- (unsigned)chipID;
@end

@implementation PS190ChipID

- (PS190ChipID)initWithChipID:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PS190ChipID;
  result = -[PS190ChipID init](&v5, sel_init);
  if (result) {
    result->_chipID = a3;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"0x%08x", self->_chipID);
}

- (unsigned)chipID
{
  return self->_chipID;
}

@end